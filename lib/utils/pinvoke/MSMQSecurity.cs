using System;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System.Security.Principal;

// @see https://github.com/jlevitt/MSMQSecurity at commit b6e5946878dce4ed89ee24012cd23b17fcaaf65e

namespace MSMQSecurity {
    [Flags]
    public enum MQQUEUEACCESSMASK {
        MQSEC_DELETE_MESSAGE = 0x00000001,
        MQSEC_PEEK_MESSAGE = 0x00000002,
        MQSEC_WRITE_MESSAGE = 0x00000004,
        MQSEC_DELETE_JOURNAL_MESSAGE = 0x00000008,
        MQSEC_SET_QUEUE_PROPERTIES = 0x00000010,
        MQSEC_GET_QUEUE_PROPERTIES = 0x00000020,
        MQSEC_DELETE_QUEUE = 0x00010000,
        MQSEC_GET_QUEUE_PERMISSIONS = 0x00020000,
        MQSEC_CHANGE_QUEUE_PERMISSIONS = 0x00040000,
        MQSEC_TAKE_QUEUE_OWNERSHIP = 0x00080000,
        MQSEC_RECEIVE_MESSAGE = (MQSEC_DELETE_MESSAGE
                               | MQSEC_PEEK_MESSAGE),
        MQSEC_RECEIVE_JOURNAL_MESSAGE = (MQSEC_DELETE_JOURNAL_MESSAGE
                                       | MQSEC_PEEK_MESSAGE),
        MQSEC_QUEUE_GENERIC_READ = (MQSEC_GET_QUEUE_PROPERTIES
                                  | MQSEC_GET_QUEUE_PERMISSIONS
                                  | MQSEC_RECEIVE_MESSAGE
                                  | MQSEC_RECEIVE_JOURNAL_MESSAGE),
        MQSEC_QUEUE_GENERIC_WRITE = (MQSEC_GET_QUEUE_PROPERTIES
                                   | MQSEC_GET_QUEUE_PERMISSIONS
                                   | MQSEC_WRITE_MESSAGE),
        MQSEC_QUEUE_GENERIC_ALL = (MQSEC_RECEIVE_MESSAGE
                                 | MQSEC_RECEIVE_JOURNAL_MESSAGE
                                 | MQSEC_WRITE_MESSAGE
                                 | MQSEC_SET_QUEUE_PROPERTIES
                                 | MQSEC_GET_QUEUE_PROPERTIES
                                 | MQSEC_DELETE_QUEUE
                                 | MQSEC_GET_QUEUE_PERMISSIONS
                                 | MQSEC_CHANGE_QUEUE_PERMISSIONS
                                 | MQSEC_TAKE_QUEUE_OWNERSHIP)
    };

    [Flags]
    internal enum SecurityInformation : uint {
        Owner = 0x00000001,
        Group = 0x00000002,
        Dacl = 0x00000004,
        Sacl = 0x00000008,
        ProtectedDacl = 0x80000000,
        ProtectedSacl = 0x40000000,
        UnprotectedDacl = 0x20000000,
        UnprotectedSacl = 0x10000000
    }

    internal enum ACL_INFORMATION_CLASS {
        AclRevisionInformation = 1,
        AclSizeInformation
    }

    [StructLayoutAttribute(LayoutKind.Sequential)]
    internal class SECURITY_DESCRIPTOR {
        public byte revision;
        public byte size;
        public short control;
        public IntPtr owner;
        public IntPtr group;
        public IntPtr sacl;
        public IntPtr dacl;
    }

    [StructLayout(LayoutKind.Sequential)]
    internal struct ACL_SIZE_INFORMATION {
        public uint AceCount;
        public uint AclBytesInUse;
        public uint AclBytesFree;
    }

    [StructLayout(LayoutKind.Sequential)]
    internal struct ACE_HEADER {
        public byte AceType;
        public byte AceFlags;
        public short AceSize;
    }

    [StructLayout(LayoutKind.Sequential)]
    internal struct ACCESS_ALLOWED_ACE {
        public ACE_HEADER Header;
        public MQQUEUEACCESSMASK Mask;
        public int SidStart;
    }

    public class QueuePath {
        private const string QueuePathFormat = @"Direct=OS:{0}\Private$\{1}";

        private string computerName;
        private string queueName;

        public QueuePath(string computerName, string queueName) {
            this.computerName = computerName;
            this.queueName = queueName;
        }

        public override string ToString() {
            return string.Format(QueuePathFormat, computerName, queueName);
        }
    }

    public class MSMQSecurity {
        private const int OWNER_SECURITY_INFORMATION = 0x1;
        private const int MQ_OK = 0x0;
        private const uint MQ_ERROR_SECURITY_DESCRIPTOR_TOO_SMALL = 0xC00E0023;
        private const uint MQ_ERROR_ILLEGAL_FORMATNAME = 0xC00E001E;
        private const uint MQ_ERROR_ACCESS_DENIED = 0xC00E0025;
        private const uint MQ_ERROR_NO_DS = 0xC00E0013;
        private const uint MQ_ERROR_PRIVILEGE_NOT_HELD = 0xC00E0026;
        private const uint MQ_ERROR_UNSUPPORTED_FORMATNAME_OPERATION = 0xC00E0020;
        private const uint MQ_ERROR_QUEUE_NOT_FOUND = 0xC00E0003;

        private static readonly Dictionary<uint, string> ErrorMessages = new Dictionary<uint, string> {
            { MQ_ERROR_ILLEGAL_FORMATNAME, "MQ_ERROR_ILLEGAL_FORMATNAME" },
            { MQ_ERROR_SECURITY_DESCRIPTOR_TOO_SMALL, "MQ_ERROR_SECURITY_DESCRIPTOR_TOO_SMALL" },
            { MQ_ERROR_ACCESS_DENIED, "MQ_ERROR_ACCESS_DENIED" },
            { MQ_ERROR_NO_DS, "MQ_ERROR_NO_DS" },
            { MQ_ERROR_PRIVILEGE_NOT_HELD, "MQ_ERROR_PRIVILEGE_NOT_HELD" },
            { MQ_ERROR_UNSUPPORTED_FORMATNAME_OPERATION, "MQ_ERROR_UNSUPPORTED_FORMATNAME_OPERATION" },
            { MQ_ERROR_QUEUE_NOT_FOUND , "MQ_ERROR_QUEUE_NOT_FOUND " }
        };

        /// <summary>
        /// Returns the access control entry flags for the given user on the given queue. Throws if
        /// user, queue, or ACE are not found.
        /// </summary>
        public static MQQUEUEACCESSMASK GetAccessMask(QueuePath queuePath, string username) {
            var sid = GetSidForUser(username);

            var gcHandleSecurityDescriptor = GetSecurityDescriptorHandle(queuePath);
            var ace = GetAce(gcHandleSecurityDescriptor.AddrOfPinnedObject(), sid);
            var aceMask = ace.Mask;

            gcHandleSecurityDescriptor.Free();

            return aceMask;
        }

        private static string GetErrorMessage(uint errorCode) {
            return ErrorMessages[errorCode];
        }

        private static string GetSidForUser(string username) {
            var account = new NTAccount(username);
            var sid = (SecurityIdentifier)account.Translate(typeof(SecurityIdentifier));

            return sid.ToString();
        }

        private static ACCESS_ALLOWED_ACE GetAce(IntPtr pSecurityDescriptor, string sid) {
            bool daclPresent;
            bool daclDefaulted;
            IntPtr pAcl = IntPtr.Zero;
            MSMQSecurity.GetSecurityDescriptorDacl(pSecurityDescriptor, out daclPresent, ref pAcl, out daclDefaulted);

            if (daclPresent) {
                ACL_SIZE_INFORMATION AclSize = new ACL_SIZE_INFORMATION();
                MSMQSecurity.GetAclInformation(pAcl, ref AclSize, (uint)Marshal.SizeOf(typeof(ACL_SIZE_INFORMATION)), ACL_INFORMATION_CLASS.AclSizeInformation);


                for (int i = 0; i < AclSize.AceCount; i++) {
                    IntPtr pAce;
                    var err = MSMQSecurity.GetAce(pAcl, i, out pAce);
                    ACCESS_ALLOWED_ACE ace = (ACCESS_ALLOWED_ACE)Marshal.PtrToStructure(pAce, typeof(ACCESS_ALLOWED_ACE));

                    IntPtr iter = (IntPtr)((long)pAce + (long)Marshal.OffsetOf(typeof(ACCESS_ALLOWED_ACE), "SidStart"));
                    byte[] bSID = null;
                    int size = (int)MSMQSecurity.GetLengthSid(iter);
                    bSID = new byte[size];
                    Marshal.Copy(iter, bSID, 0, size);
                    IntPtr ptrSid;
                    MSMQSecurity.ConvertSidToStringSid(bSID, out ptrSid);
                    string strSID = Marshal.PtrToStringAuto(ptrSid);

                    if (strSID == sid) {
                        return ace;
                    }
                }

                throw new Exception(string.Format("No ACE for SID {0} found in security descriptor", sid));
            }
            else {
                throw new Exception("No DACL found for security descriptor");
            }

        }

        private static GCHandle GetSecurityDescriptorHandle(QueuePath queuePath) {
            byte[] securityDescriptorBytes;
            int length;
            int lengthNeeded;
            uint result;

            string formatName = queuePath.ToString();

            //Call MQGetQueueSecurity two times. The first time, set the nLength
            //parameter to 0. The function then informs you of the size that you need for the
            //security descriptor in lpnLengthNeeded.
            result = MSMQSecurity.MQGetQueueSecurity(
                      formatName
                    , (int)SecurityInformation.Dacl
                    , IntPtr.Zero
                    , 0
                    , out lengthNeeded);

            if (result != MSMQSecurity.MQ_ERROR_SECURITY_DESCRIPTOR_TOO_SMALL) {
                //Something went wrong. Display error, and then exit.
                string message = "There was an error calling MQGetQueueSecurity."
                    + Environment.NewLine
                    + "Error Number:  " + result.ToString()
                    + Environment.NewLine
                    + "Error Message:  " + MSMQSecurity.GetErrorMessage(result);

                throw new Exception(message);
            }

            //Now we know how big to make the security descriptor.
            length = lengthNeeded;
            securityDescriptorBytes = new byte[length];

            //Get a pointer to the SD
            IntPtr pSecurityDescriptor = new IntPtr();
            GCHandle gcHandleSecurityDescriptor = GCHandle.Alloc(securityDescriptorBytes, GCHandleType.Pinned);
            pSecurityDescriptor = gcHandleSecurityDescriptor.AddrOfPinnedObject();

            //Call MQGetQueueSecurity
            result = MSMQSecurity.MQGetQueueSecurity(
                      formatName
                    , (int)SecurityInformation.Dacl
                    , pSecurityDescriptor
                    , length
                    , out lengthNeeded);

            if (result != MSMQSecurity.MQ_OK) {
                gcHandleSecurityDescriptor.Free();

                //Something else went wrong. Display error, and then exit.
                string message = "There was an error calling MQGetQueueSecurity to read the SecurityDescriptor."
                    + Environment.NewLine
                    + "Error Number:  " + result.ToString()
                    + Environment.NewLine
                    + "Error Message:  " + MSMQSecurity.GetErrorMessage(result);

                throw new Exception(message);
            }

            var securityDescriptor = new SECURITY_DESCRIPTOR();
            Marshal.PtrToStructure(pSecurityDescriptor, securityDescriptor);

            return gcHandleSecurityDescriptor;
        }

        #region p/invoke definitions
        [DllImport("mqrt.dll", SetLastError = false)]
        private static extern uint MQGetQueueSecurity(
            [MarshalAs(UnmanagedType.LPWStr)]string lpwcsFormatName,
            int SecurityInformation,
            IntPtr pSecurityDescriptor,
            int nLength,
            out int lpnLengthNeeded);

        [DllImport("advapi32.dll", CharSet = CharSet.Unicode, SetLastError = true)]
        [return: MarshalAs(UnmanagedType.Bool)]
        private static extern bool GetSecurityDescriptorDacl(
            IntPtr pSecurityDescriptor,
            [MarshalAs(UnmanagedType.Bool)] out bool bDaclPresent,
            ref IntPtr pDacl,
            [MarshalAs(UnmanagedType.Bool)] out bool bDaclDefaulted
            );

        [DllImport("advapi32.dll", CharSet = CharSet.Unicode, SetLastError = true)]
        [return: MarshalAs(UnmanagedType.Bool)]
        private static extern bool GetAclInformation(
            IntPtr pAcl,
            ref ACL_SIZE_INFORMATION pAclInformation,
            uint nAclInformationLength,
            ACL_INFORMATION_CLASS dwAclInformationClass
         );

        [DllImport("advapi32.dll", CharSet = CharSet.Unicode, SetLastError = true)]
        private static extern int GetAce(
            IntPtr aclPtr,
            int aceIndex,
            out IntPtr acePtr
         );

        [DllImport("advapi32.dll", CharSet = CharSet.Unicode, SetLastError = true)]
        private static extern int GetLengthSid(
            IntPtr pSID
         );

        [DllImport("advapi32.dll", CharSet = CharSet.Unicode, SetLastError = true)]
        [return: MarshalAs(UnmanagedType.Bool)]
        private static extern bool ConvertSidToStringSid(
            [MarshalAs(UnmanagedType.LPArray)] byte[] pSID,
            out IntPtr ptrSid
         );

        [DllImport("netapi32.dll", CharSet = CharSet.Unicode, SetLastError = true)]
        private static extern int NetApiBufferFree(
            IntPtr buffer
         );

        #endregion
    }
}
