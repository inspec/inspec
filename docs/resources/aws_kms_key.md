---
title: About the aws_kms_key Resource
---

# aws_kms_key

Use the `aws_kms_key` InSpec audit resource to test properties of a single AWS KMS Key.

AWS Key Management Service (AWS KMS) is a managed service that makes it easy for you to create and control the encryption keys used to encrypt your data. AWS KMS lets you create master keys that can never be exported from the service and which can be used to encrypt and decrypt data based on policies you define.

Each AWS KMS Key is uniquely identified by its key-id or key-arn.

<br>

## Syntax

An aws_kms_key resource block identifies a key by key_arn or just the key.

    # Find a kms key by arn
    describe aws_kms_key('arn:aws:kms:us-east-1::key/4321dcba-21io-23de-85he-ab0987654321') do
      it { should exist }
    end
    
    # Find a kms key by just the id
    describe aws_kms_key('4321dcba-21io-23de-85he-ab0987654321') do
      it { should exist }
    end

    # Hash syntax for key arn
    describe aws_kms_key(key_arn: 'arn:aws:kms:us-east-1::key/4321dcba-21io-23de-85he-ab0987654321') do
      it { should exist }
    end

<br>

## Examples

The following examples show how to use this InSpec audit resource.

### Test that the specified key does exist

    describe aws_kms_key('arn:aws:kms:us-east-1::key/4321dcba-21io-23de-85he-ab0987654321') do
      it { should exist }
    end

### Test that the specified key is enabled

    describe aws_kms_key('arn:aws:kms:us-east-1::key/4321dcba-21io-23de-85he-ab0987654321') do
      it { should be_enabled }
    end

### Test that the specified key is rotation enabled

    describe aws_kms_key('arn:aws:kms:us-east-1::key/4321dcba-21io-23de-85he-ab0987654321') do
      it { should be_rotation_enabled }
    end

<br>

## Properties

### key_id

The globally unique identifier for the key.

    describe aws_kms_key('arn:aws:kms:us-east-1::key/4321dcba-21io-23de-85he-ab0987654321') do
      its('key_id') { should cmp "id" }
    end

### arn

The ARN identifier of the specified key. An ARN uniquely identifies the key within AWS.

    describe aws_kms_key('arn:aws:kms:us-east-1::key/4321dcba-21io-23de-85he-ab0987654321') do
      its('arn') { should cmp "arn:aws:kms:us-east-1::key/4321dcba-21io-23de-85he-ab0987654321" }
    end

### creation_date

Specifies the date and time when the key was created.

    describe aws_kms_key('arn:aws:kms:us-east-1::key/4321dcba-21io-23de-85he-ab0987654321') do
      its('creation_date') { should be < Time.now - 10 * 86400 }
    end

### created_days_ago

Specifies the number of days since the key was created.

    describe aws_kms_key('arn:aws:kms:us-east-1::key/4321dcba-21io-23de-85he-ab0987654321') do
      its('created_days_ago') { should be > 10 }
    end

### key_usage

Specifies the cryptographic operations for which you can use the key. Currently the only allowed value is ENCRYPT_DECRYPT , which means you can use the key for the encrypt and decrypt operations.

    describe aws_kms_key('arn:aws:kms:us-east-1::key/4321dcba-21io-23de-85he-ab0987654321') do
      its('key_usage') { should cmp "ENCRYPT_DECRYPT" }
    end

### key_state

Specifies the state of the key one of "Enabled", "Disabled", "PendingDeletion", "PendingImport".

    describe aws_kms_key('arn:aws:kms:us-east-1::key/4321dcba-21io-23de-85he-ab0987654321') do
      its('key_state') { should cmp "Enabled" }
    end

### description

Specifies the description of the key.

    describe aws_kms_key('arn:aws:kms:us-east-1::key/4321dcba-21io-23de-85he-ab0987654321') do
      its('description') { should cmp "key-description" }
    end

### deletion_date

Specifies the date and time after which AWS KMS deletes the key. This value is present only when KeyState is PendingDeletion , otherwise this value is omitted.

    describe aws_kms_key('arn:aws:kms:us-east-1::key/4321dcba-21io-23de-85he-ab0987654321') do
      its('deletion_date') { should cmp > Time.now + 7 * 86400 }
    end

### valid_to

Provides the data and time until the key is not valid.  Once the key is not valid, AWS KMS deletes the key and it becomes unusable.  This value will be null unless the keys Origin is EXTERNAL and its ExpirationModel is KEY_MATERIAL_EXPIRES.

    describe aws_kms_key('arn:aws:kms:us-east-1::key/4321dcba-21io-23de-85he-ab0987654321') do
      its('valid_to') { should cmp > Time.now + 7 * 86400 }
    end

## Matchers

This InSpec audit resource has the following special matchers. For a full list of available matchers (such as `exist`) please visit our [matchers page](https://www.inspec.io/docs/reference/matchers/).

### be_enabled

The test will pass if the specified key is enabled.

    describe aws_kms_key('arn:aws:kms:us-east-1::key/4321dcba-21io-23de-85he-ab0987654321') do
      it { should be_enabled }
    end
    
### be_external
Provides whether the source of the key's key material is external or from not.  If it is not external than it was created by AWS KMS.  When it is external, the key material was imported from an existing key management infrastructure or the key lacks key material.

    describe aws_kms_key('arn:aws:kms:us-east-1::key/4321dcba-21io-23de-85he-ab0987654321') do
      its { should be_external }
    end
    
### have_aws_key_manager

Provides whether or not the key manager is from AWS. If it is not managed by AWS, it is managed by the customer.

    describe aws_kms_key('arn:aws:kms:us-east-1::key/4321dcba-21io-23de-85he-ab0987654321') do
      its { should have_aws_key_manager }
    end
    
### have_key_expiration

Specifies whether the key's key material expires. This value is null unless the keys Origin is External.

    describe aws_kms_key('arn:aws:kms:us-east-1::key/4321dcba-21io-23de-85he-ab0987654321') do
      its { should have_key_expiration }
    end

### have_rotation_enabled

The test will pass if automatic rotation of the key material is enabled for the specified key.

    describe aws_kms_key('arn:aws:kms:us-east-1::key/4321dcba-21io-23de-85he-ab0987654321') do
      it { should have_rotation_enabled }
    end
