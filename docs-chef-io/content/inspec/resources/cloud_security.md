+++
title = "Cloud Security"
draft = false
gh_repo = "inspec"

[menu]
  [menu.inspec]
    title = "Cloud Security"
    identifier = "inspec/reference/config.md Cloud Security"
    parent = "inspec/reference"
    weight = 60
+++

Cloud security is a discipline of cyber security and involves the procedures, policies, controls, and technologies to secure cloud computing environments against unauthorized use/access, distributed denial of service (DDOS) attacks, hackers, malware, and other risks.  The cloud provider and the customer together share the responsibility of the cloud security in keeping data private and safe across online-based infrastructure, applications, and platforms. They also support regulatory data compliance.

## Why is cloud security important?

Cloud adoption is rapidly growing. With the growing transition to cloud-based environments, the dynamic nature of infrastructure management, especially in scaling applications and services, can bring many challenges to enterprises when adequately resourcing their departments. These as-a-service models provide organizations the ability to offload a number of time-consuming and IT-related tasks.

As companies continue to migrate to the cloud, understanding the security requirements for keeping data safe has become crucial. While third-party cloud computing providers such as Amazon Web Services (AWS), Microsoft Azure may take on the cloud-infrastructure management, the responsibility of data asset security and accountability lies on the company itself.

Security threats have become more advanced as the digital landscape continues to evolve. These threats explicitly target cloud computing providers due to an organization's overall lack of visibility in data access and movement. Without taking active steps to improve their cloud security, organizations can face significant governance and compliance risks when managing client information, regardless of where it is stored.

## What does AWS Shared Responsibility Model Mean?

A shared responsibility model is a cloud security framework that dictates the security obligations of a cloud computing provider and its users to ensure accountability. This shared model can help relieve the customer's operational burden as AWS operates, manages and controls the components from the host operating system and virtualization layer down to the physical security of the facilities in which the service operates. Security and Compliance is a shared responsibility between AWS and the customer.

In other words, the the shared responsibility model means the cloud provider is responsible for the security of the cloud, while the customer is responsible for security in the cloud.

## What does Chef's Cloud Security Deliver?

Security is one of the biggest concerns with companies migrating to the cloud. The AWS Shared Responsibility model removes the ambiguity of cloud security responsibilities. Chef products aids you in managing the customer-responsible tasks to detect and correct issues in your cloud infrastructure and automate the ongoing management of your security responsibilities. Chef provides tools to define and validate the security requirements and application configurations (InSpec) to apply configuration changes and remediate detected issues.

### Chef Products and AWS Shared Responsibility Model

The Chef Automate can help you automate the ongoing compliance management and system state in your instances by providing a means to detect and correct security issues in a programmatic and repeatable fashion. The Chef InSpec reduces the burden of securing hybrid workloads by providing the ability to communicate directly with cloud-native APIs to audit your environment’s configuration. Since Chef InSpec already has facilities for scanning servers and virtual machines, it provides a way to scan traditional and cloud-native environments all in one place.

Chef Automate provides you an up-to-date sense of the security and configuration state of all of your AWS assets so you can avoid configuration drift as systems evolve over time. You can track and manage your full cloud estate from one place, with a fully filterable and searchable history of all audits and changes. For AWS, Chef Automate is available as a *do it yourself* offering for existing customers running on EC2 or your own systems, through the AWS Marketplace, as well as through OpsWorks for Chef Automate, a managed service offered by AWS.

Using InSpec, you can gain visibility into the state of your apps, virtual machines, and configuration settings before you migrate your workloads into AWS. You can configure new nodes and instances from a known state, and define the steps required to configure an instance, and spin up new nodes against a desired state automatically, reducing the work required and enforcing consistency of the newly launched instances.

### Approaches to the AWS hared Responsibility Model

In the AWS shared responsibility model, Amazon’s responsibilities fall into two categories. The first is the hardware, which includes all Regions, Availability Zones, and Edge Locations of the AWS global infrastructure. The second category is managing the software for the compute, storage, database, and networking aspects of cloud computing.

The customer, meanwhile, controls the data and configurations within that cloud environment. In the AWS shared responsibility model, customer responsibility falls into categories such as:

- Customer data stored in the cloud
- Platform, application, and identity & access management
- Operating system, network, and firewall configuration
- Data encryption, integrity, and authentication

The **AWS Shared Responsibility Model** outlines how AWS commits to the security “of” their cloud, and where customers need to focus on security “in” the cloud.

As a customer/company managing your own IT infrastructure (either bare metal or VMs) need to create a strategy and practice to manage all the elements depicted in the screen. AWS commits to the security of their platform and distributed infrastructure as a service to their customer. While benefiting from their expertise and scale here is a huge boon for customers, it still means you need to have a plan to secure everything above the line.

### Categories in AWS Shared Responsibility Model

Basically, there are three categories of responsibilities in the Shared Responsibility Model:

 ![AWS Shared Responsibility Model](/images/inspec/cloud_security_aws_shared_model.png)

- Inherited controls - Responsibilities that are always the provider’s

  The security responsibilities that are always the provider’s are related to the safeguarding of the infrastructure itself, as well as access to, patching, and configuration of the physical hosts and the physical network on which the compute instances run, power availability, and the storage and other resources resides. The security tasks extends by protecting end user data, applications, operating systems, endpoints, and network traffic.

- Customer specific infrastructure - Responsibilities that are always the customer’s, and

  The security responsibilities that are always the customer’s include managing users and their access privileges (identity and access management), the safeguarding of cloud accounts from unauthorized access, the encryption and protection of cloud-based data assets, security of the zone data, and managing its security posture (compliance.

- Shared controls - Responsibilities that vary depending on the service model

  Infrastructure as a Service (IaaS), Platform as a Service (PaaS), or Software as a Service (SaaS),  such as cloud email:

  - IaaS (Infrastructure-as-a-Service): A hybrid approach, where organizations can manage some of their data and applications on-premise while relying on cloud providers to manage servers, hardware, networking, virtualization, and storage needs.

  - PaaS (Platform-as-a-Service): Provides organizations the ability to streamline their application development and delivery by providing a custom application framework that automatically manages operating systems, software updates, storage, and supporting infrastructure in the cloud.

  - SaaS (Software-as-a-Service): Cloud-based software hosted online and typically available on a subscription basis. Third-party providers manage all potential technical issues, such as data, middleware, servers, and storage, minimizing IT resource expenditures and streamlining maintenance and support functions.

For inherited controls, you can rely on AWS to supply the security of the cloud itself. For customer specific security tasks, the apps and configurations that are specific to your unique circumstances running on the AWS platform, such as planning on how to manage the security of your instances, including user access controls (IAM), managing patches in your operating systems, which firewall ports are open/closed in your instances.

## Release Items - Heading/entire section to be rewritten
Docker
Kubernets
Google Foundations
SoC
CIS for docker and kubernetes

### Validate Docker and Kubernetes Configurations

Chef provides curated, codified, and ready-to-run CIS Benchmark templates for Docker and Kubernetes, which can be used to perform security scans as an integrated part of automated DevSecOps workflows. By integrating compliance checks as part of automated workflow, you can validate all your container and cloud-native environments are secure.

Benchmark	Audit
CIS Docker Community Edition Benchmark – Level 1 & 2 	Yes
CIS Kubernetes Benchmark - Level 1 & 2	Yes

### Docker Benchmark Recommendations

https://www.chef.io/solutions/chef-and-docker

The Docker benchmark recommendations applies to both the host and the Docker components, which are:

- Host Configuration: Secure the host on which Docker engine runs so that the container it hosts are safe.
- Docker Daemon Configuration/Files: Secure the behaviour of Docker Daemon that manages all containers on the Docker host.
- Container Images and Build File: Ensure trusted images and verified packages.
- Container Runtime: Ensure complaint container startup and runtime parameters configurations to ensure there is no compromise of the host and containers running on it such as avoiding usage of privileged containers and avoid usage of ssh within containers.
- Docker Security Operations: Ensure limit on the number of containers and container images on the same host.
- Docker Swarm Configuration: Secure Docker Swarm - the container orchestrator that can manage clusters of containers and their lifecycle.

### CIS Benchmark Recommendations

https://www.chef.io/solutions/chef-and-kubernetes

The CIS Benchmark for Kubernetes includes configuration checks on the following components:

- Control Pane
  - Master Node Configuration
  - API Server
  - Controller manager
  - Scheduler
  - Etcd
- Worker Nodes
  - Worker node config files
  - Kubelet configuration
- Kubernetes Elements
  - Role Based Access Control, Pods, Network Policies , container network interface (CNI) and Secrets

### Mitigate OS Misconfigurations and Vulnerabilities

Chef has built premium content specific to helping client ensure that the Host OS is properly hardened in your cloud native environments to mitigate host security misconfigurations and vulnerabilities  Using Chef Premium Content customers can also scan the host operating systems for compliance to benchmarks such as CIS or DISA-STIG by running the corresponding profiles. As part of this you can consider various CIS Security Benchmarks for your container host that Chef provides such as RHEL, SUSE Linux, CentOS Linux, Debian, Ubuntu and so on.

## Release Scope - Draft 2

Azure Policy Related Enhacements
Enhancements to cloud provider integrations for complaince scans
Cloud aligned pricing
Docker and Kubernetes updated CIS aligned profiles
AWS Azure GCP CIS aligned profiles
InSpec 5.0 enhancements and cloud resource packs

Cloud security posture management (CSPM) combines threat intelligence, detection, and remediation that works across complex collections of cloud-based applications.

Incorporating CIS Benchmarks
We also took a look at some of the pre-built resources Chef provides to our enterprise customers and, in particular, InSpec profiles for the CIS Benchmarks. These benchmarks, created by the Center for Internet Security (CIS), can be used to help validate a variety of regulatory compliance frameworks, as well as provide a baseline for general security best practices on a variety of platforms. The CIS profiles included with a Chef subscription have been certified by CIS, supported by Chef, and can be run from within Chef Automate with the push of a button, giving you a plethora of actionable insights into your cloud estate right out of the gate.


Within Chef Automate, scans can be configured to be run on-demand or on a schedule, providing continuous, real-time insight into your security status across your environments, as well as filterable dashboards to address and remediate any failures uncovered. Combine that with an auditable history of scans, and you have everything you need to continuously audit your estate without slowing down your software development cycle.