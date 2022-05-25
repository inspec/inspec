+++
title = "Cloud Security"
draft = false
gh_repo = "inspec"

[menu]
  [menu.inspec]
    title = "Cloud Security"
    identifier = "inspec/Cloud Security"
    parent = "inspec"
    weight = 35
+++

Cloud security is a cyber security discipline involving the procedures, policies, controls, and technologies to secure cloud computing environments against unauthorized use/access, distributed denial of service (DDOS) attacks, hackers, malware, and other risks.  The cloud provider and customer share the responsibility for maintaining cloud security by keeping data private and safe across online-based infrastructure, applications, and platforms, and by maintaining regulatory data compliance.

## The importance of Cloud Security

Cloud adoption is rapidly growing. With the growing transition to cloud-based environments, the dynamic nature of infrastructure management, especially in scaling applications and services, can bring many challenges to enterprises when adequately resourcing their departments. These as-a-service models allow organizations the ability to offload several time-consuming and IT-related tasks.

As companies migrate to the cloud, understanding the security requirements for keeping data safe has become crucial. While third-party cloud computing providers such as Amazon Web Services (AWS) and Microsoft Azure may take on cloud-infrastructure management, the responsibility of data asset security and accountability lies on the company itself.

Security threats have become more advanced as the digital landscape continues to evolve. These threats explicitly target cloud computing providers due to an organization's overall lack of visibility in data access and movement. Without taking active steps to improve their cloud security, organizations can face significant governance and compliance risks when managing client information, regardless of where it is stored.

## Shared Cloud Responsibility Model

A shared responsibility model is a cloud security framework that dictates the security obligations of a cloud computing provider and its users to ensure accountability. This shared model can help relieve the customer's operational burden as AWS operates, manages, and controls the components from the host operating system and virtualization layer down to the physical security of the facilities in which the service operates. **Security** and **Compliance** are a shared responsibility between AWS and the customer.

In other words, the shared responsibility model means the cloud provider is responsible for the security of the cloud, while the customer is responsible for security in the cloud.

## Cloud Security Posture Management

Cloud Security Posture Management (CSPM) automates the identification and remediation of risks across cloud infrastructures, including Infrastructure as a Service (IaaS), Software as a Service (Saas), and Platform as a Service (PaaS). CSPM is used for risk visualization and assessment, incident response, compliance monitoring, and DevOps integration and can uniformly apply best practices for cloud security to hybrid, multi-cloud, and container environments. CSPM involves threat intelligence, detection, and remediation that works across complex collections of cloud-based applications.

CSPM tools play an essential role in securing a cloud environment by reducing the possibility of data breaches. According to Gartner, misconfiguration of the cloud environment is one of the more common mistakes in the cloud that can lead to a data breach. Using a CSPM tool can reduce cloud-based security incidents due to misconfigurations by 80%.

## Introducing Chef's Cloud Security

Chef Cloud Security extends DevSecOps with compliance support for native cloud assets, enabling end-to-end management of on-premise, cloud, and native cloud resources. In addition, it targets DevOps success in enterprise deployments to deliver a unified and scalable platform that accelerates the delivery of secure and compliant application releases in mixed computing environments.

Security is one of the biggest concerns with companies migrating to the cloud. Chef products aid you in managing the customer-responsible tasks to detect and correct issues in your cloud infrastructure and automate the ongoing management of your security responsibilities. Chef provides tools to define and validate the security requirements and application configurations (InSpec) to apply configuration changes and remediate detected issues.

The AWS Shared Responsibility Model removes the ambiguity of cloud security responsibilities. Chef Cloud Security product also has built-in CSPM tools to power and secure your cloud infrastructure.

### Benefits of Chef's Cloud Security

Chef Cloud Security delivers the following benefits:

- Built-in compliance that maintains continuous compliance across the entire cloud estate.

- Coordination of security, development, testing, and operations participation to make it easier to carry out security checks at every stage of the DevOps pipeline with coded artifacts, automated tests and enterprise control, and visibility.

- Continuously monitors cloud environments in real-time for threat detection;

- Detects misconfigurations and aids in prioritizing them across clouds.

- Detects common Identity and Access Management (IAM) risks and help prioritizes misconfigurations across the public cloud to meet IAM compliance mandates- passwords, key rotation, and so on.

- Facilitation of existing skillsets without time-consuming and costly training for managing compliance and security posture for cloud-native technologies, including containers, Kubernetes, and microservices.

- Functions with IaaS, SaaS, and PaaS platforms in containerized, hybrid cloud, and multi-cloud environments.

- Maintains an inventory of best practices for different cloud configurations and services.

- Maps current configuration statuses to a security control framework or regulatory standard.

- Monitors storage buckets, encryption, and account permissions for misconfigurations and compliance risks.

- Support for native-cloud assets for multi-cloud deployment across AWS, Azure, Google, and Alibaba clouds using certified Center for Internet Security (CIS)/ Defense Information Systems Administration (DISA) Security Technical Implementation Guides (STIG) profiles to scan and detect security configuration issues.

- Support SOC2 (Security Operation Center) compliance, voluntary compliance standard for service organizations, for cloud accounts.

### Chef Cloud Security Posture Management Framework

The key features of the Cloud Security Posture Management (CSPM) tools include:

- End-to-end visibility governance
  - Robust Detections: Easy to read, filterable scan reports (control summary) with detailed descriptions of all security controls and their results.
  - Multi-Cloud Reporting: Cloud Integration support - GCP, AWS, Azure
  - Data Aggregation: Data Export into 3rd Party tools (ServiceNow, Splunk)
  - Azure: DevOps Governance and Policy Integration without Automate
  - Third-party tools: Terraform, Postgres

- Containers
  - Best practices for Docker Enterprise Edition based on CIS

- K8 Pods
  - Security profiles for Kubernetes based on CIS benchmarks
  - Remediation content for Kubernetes environment for security configuration violations based on CIS standards

- Cloud
  - Pre-built service and resource templates for custom policies across 100+ AWS, GCP, and Azure resources
  - Policy Compliance for the latest OS Versions (CentOS, RHEL, Ubuntu) & DB versions (Oracle, PostgreSQL)  as per CIS best practices

- Host
  - Remediation Content: Accessing Remediate profiles from Chef UI
  - Fast, Scalable Remediation for security configuration violations based on CIS standards

### Chef Products and AWS Shared Responsibility Model

**Chef Automate** can help you automate the ongoing compliance management and system state in your instances by providing a means to detect and correct security issues in a programmatic and repeatable fashion. You can configure on-demand or on-schedule scans, providing continuous and real-time insights into the security status across your environments. In addition, you can view the filterable dashboards to address and remediate any failures without slowing down your software development cycle.

Chef Automate provides you an up-to-date sense of your entire AWS assets' security and configuration state for cloud environments. You can avoid configuration drift as systems evolve and can manage the entire cloud estate from one place. For AWS, Chef Automate is available as a *do it yourself* offering for existing customers running on EC2 or you can use AWS Marketplace and OpsWorks for Chef Automate (a managed service provided by AWS) on your systems.

**Chef InSpec** reduces the burden of securing hybrid workloads by providing the ability to communicate directly with cloud-native APIs to audit your environment’s configuration. Since Chef InSpec already has facilities for scanning servers and virtual machines, it provides an effortless infrastructure to scan traditional and cloud-native environments all in one place. Using InSpec, you can gain visibility into the state of your apps, virtual machines, and configuration settings before you migrate your workloads into AWS. You can also configure new nodes and instances from a known state, define the steps required to configure an instance, and spin up new nodes against the desired state automatically, reducing the work needed and enforcing consistency of the newly launched instances.

**Chef Infra** allows you to transform infrastructure into code. Whether you are operating in the cloud, on-premises, or in a hybrid environment, Chef Infra automates how infrastructure is configured, deployed, and managed across your network, regardless of the size. It enables you to remediate the issues identified by Chef InSpec. In addition, it allows you to manage both traditional infrastructure and Virtual Machines (VMs) and the integrated cookbooks configured infrastructure and cloud resources.

#### Approaches to the AWS Shared Responsibility Model

Amazon’s responsibilities fall into two categories in the AWS shared responsibility model. The first is the hardware, including all Regions, Availability Zones, and Edge Locations of the AWS global infrastructure. The second category is managing the software for the compute, storage, database, and networking aspects of cloud computing.

The customer, meanwhile, controls the data and configurations within that cloud environment. In the AWS Shared Responsibility Model, customer responsibility falls into categories such as:

- Customer data stored in the cloud
- Platform, application, and identity & access management
- Operating system, network, and firewall configuration
- Data encryption, integrity, and authentication

The **AWS Shared Responsibility Model** outlines how AWS commits to their cloud's security and where customers need to focus on security in the cloud.

As a customer/company managing your own IT infrastructure (either bare metal or VMs) need to create a strategy and practice to manage all the elements depicted on the screen. AWS commits to the security of its platform and distributed infrastructure as a service to their customer. Their expertise and scale provide a massive benefit for customers, but you still need to have a plan to secure everything.

![Cloud Shared Responsibility Model](/images/inspec/cloud_security_aws_shared_model.png)

#### Categories in Cloud Shared Responsibility Model

There are three categories of responsibilities in the Shared Responsibility Model:

- Inherited controls - Responsibilities that are always the providers.

  The security responsibilities that are always the providers relate to safeguarding the infrastructure itself and access to, patching, and configuration of the physical hosts and the physical network on which the compute instances run, and where the storage and other resources reside. The security tasks extend by protecting end-user data, applications, operating systems, endpoints, and network traffic.

- Customer-specific infrastructure - Responsibilities that are always the customer’s, and

  The security responsibilities that are always the customer’s include managing users and their access privileges (identity and access management), safeguarding cloud accounts from unauthorized access, the encryption and protection of cloud-based data assets, security of the zone data, and managing its security posture compliance.

- Shared controls - Responsibilities that vary depending on the service model.

  - Infrastructure-as-a-Service (IaaS)): A hybrid approach where organizations can manage some of their data and applications on-premise while relying on cloud providers to manage servers, hardware, networking, virtualization, and storage needs.

  - Platform-as-a-Service (PaaS): Provides organizations the ability to streamline their application development and delivery by providing a custom application framework that automatically manages operating systems, software updates, storage, and supporting infrastructure in the cloud.

  - Software-as-a-Service (SaaS): Cloud-based software hosted online and typically available on a subscription basis. Third-party providers manage all potential technical issues, such as data, middleware, servers, and storage, minimizing IT resource expenditures and streamlining maintenance and support functions.

For inherited controls, you can rely on AWS to provide the security of the cloud itself. For customer-specific security tasks, the apps and configurations specific to your unique circumstances are running on the AWS platform. For example, planning on managing the security of your instances, including user access controls (IAM), managing patches in your operating systems and which firewall ports are open or closed in your instances.

### Auditing Cloud Environments with Chef

Chef scans systems across all environments (Dev, Pre-Production, Production), all systems (Cloud, Kubernetes, VMs, Containers, Windows, Linux), and all clouds (AWS, Azure, Google, Alibaba).

You have access to the Chef InSpec resources library, including benchmarks and profiles created by the Center for Internet Security (CIS). The CIS benchmark turns security best practices into specific, actionable controls that can run against your cloud systems. In addition, the Chef CIS benchmarks prevent the misconfiguration of cloud environments. Thus, fixing the misconfigurations in the Infrastructure As Code (IaC) used to create the resources.

The CIS/DISA STIG certified profiles are available for Amazon Web Services, Microsoft Azure, GCP, Alibaba Cloud, and Google Cloud/Compute platforms. These profiles provide insights about services like identity management, security groups, and storage buckets that are implemented securely. With Chef InSpec's easy-to-code language and built-in profiles and resources, you can address your organization's concerns. And with Chef Infra, you can take corrective actions based on the insights derived.

Policy as code with provisioning tools like Terraform merges infrastructure-as-code and compliance-as-code into a single workflow. Chef InSpec can be used with *Terraform* in two different ways to confirm compliance:

- Audit provisioned infrastructure: When developing Terraform code for repositories, Chef InSpec can verify that the resources are updated to match the tested and approved criteria.

- Terraform code declaration: Chef InSpec validates the infrastructure configuration using test-driven development, and Terraform can be used to provision resources accordingly. In this way, Terraform manages provisioning while Chef InSpec ensures the provisioned resources meet the organization’s policy requirements.

Together, these capabilities ensure that with Chef, you have a single way to detect, correct, and automate any issue in any cloud-based environment.

### Docker Benchmark Recommendations

The following Docker benchmark recommendations apply to both the host and the Docker components:

- Host configuration secures the host on which the Docker engine runs, and the container that it hosts.
- Docker daemon configurations secure the Docker daemon behavior that manages all containers on the Docker host.
- Container images and build files ensure that the images can be trusted and the packages are verified.
- Container runtime ensures that no compromise is made on the compliant container startup (host) and runtime parameter configurations, such as avoiding privileged containers and SSH usage within containers.
- Docker security operations limit the number of containers and respective images on the same host.
- Docker swarm configuration secure Docker Swarm, the container orchestrator that manages container clusters and their lifecycle.

### Center for Internet Security Benchmark Recommendations

The CIS benchmark for Kubernetes includes configuration checks on the following components:

- Control Pane
  - API server
  - Controller manager
  - Etcd
  - Master node configuration
  - Scheduler
- Worker Nodes
  - Kubelet configuration
  - Worker node config files
- Kubernetes Elements
  - Container Network Interface (CNI) and secrets
  - Network Policies
  - Pods
  - Role based access control

### Docker and Kubernetes Validation

Chef provides curated, codified, and ready-to-run CIS benchmark templates for Docker and Kubernetes clusters. These CIS benchmark templates perform security scans as an integrated part of automated DevSecOps workflows. By integrating compliance checks with automated workflow, you can validate that all your container and cloud-native environments are secure.

### Mitigate Operating System Misconfigurations and Vulnerabilities

Chef provides premium content that hardens your host operating systems (OS) in the cloud-native environments to mitigate host security misconfigurations and vulnerabilities. Using Chef's premium content, you can scan the host operating systems for compliance with benchmarks, such as CIS or DISA-STIG, by running the corresponding profiles. In addition, Chef provides CIS security benchmarks for operating systems such as RHEL, SUSE Linux, CentOS Linux, Debian, and Ubuntu for your container hosts.

### Chef Premium Content for Cloud Environments

Chef Premium Content offers cloud target scanning to scan an extensive set of cloud resources across all major public cloud providers, containers, and Kubernetes deployments.

| Benchmarks                                            | Level          | Audit          | Remediate  |
| :-----------------------------------------------------| :------------- | :--------------| :--------- |
| CIS Amazon Web Services Foundation Benchmark          | 1 and 2        | Yes            |            |
| CIS Azure Foundations Benchmark                       | 1 and 2        | Yes            | Yes        |
| CIS Docker Community Edition Benchmark                | 1 and 2        | Yes            | Yes        |
| CIS Google Cloud Platform Foundation Benchmark        | 1 and 2        | Yes            |            |
| CIS Kubernetes Benchmark                              | 1 and 2        | Yes            | Yes        |
| CIS Microsoft 365 Foundations Benchmark               | 1 and 2        | Yes            | Yes        |
