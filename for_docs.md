Creating a comprehensive architecture diagram involves visualizing all the components in the setup, from the AWS account level down to the Kubernetes cluster and its individual components. Below is a description of the architecture along with the necessary elements to visualize it.

### Description of the Architecture

#### AWS Infrastructure
1. **AWS Account**
   - The AWS account is the highest-level container for all AWS resources.

2. **VPC (Virtual Private Cloud)**
   - **Subnets**: Divided into public and private subnets.
   - **Internet Gateway**: Allows internet access for resources in the public subnet.
   - **NAT Gateway**: Allows resources in the private subnet to access the internet.

3. **Security Groups**
   - Define inbound and outbound rules for resources within the VPC.

#### Kubernetes Cluster
1. **EKS Cluster (Elastic Kubernetes Service)**
   - **Node Groups**: EC2 instances forming the worker nodes of the cluster.
   - **IAM Roles**: Permissions for EKS to manage AWS resources.

#### ReportPortal Deployment
1. **Helm Charts**
   - Used to deploy ReportPortal and its dependencies (PostgreSQL, RabbitMQ, MinIO).

2. **Components**
   - **ReportPortal UI**: User interface accessible via a LoadBalancer.
   - **ReportPortal API**: Backend services for handling API requests.
   - **PostgreSQL**: Database for storing ReportPortal data.
   - **RabbitMQ**: Message broker for handling background tasks.
   - **MinIO**: Object storage for files and attachments.

#### Integration with Maven Spring Boot Project
1. **Spring Boot Application**
   - Integrated with ReportPortal via dependencies and configurations.

### Architecture Diagram

Below is a textual description of the architecture diagram, which you can visualize using a diagramming tool like draw.io, Lucidchart, or any other preferred tool.

1. **AWS Account**
   - **VPC**
     - **Public Subnet**
       - **Internet Gateway**
       - **EKS Cluster**
         - **Node Group (EC2 Instances)**
           - **Helm Deployment**
             - **ReportPortal UI (Service with LoadBalancer)**
             - **ReportPortal API**
             - **PostgreSQL (StatefulSet)**
             - **RabbitMQ (StatefulSet)**
             - **MinIO (StatefulSet)**
             - **Services and Ingress Controllers**
             - **ConfigMaps and Secrets**
     - **Private Subnet**
       - **NAT Gateway**

2. **Security Groups**
   - Configured to allow necessary traffic between components (e.g., from the internet to the LoadBalancer, between pods in the cluster, etc.).

3. **Spring Boot Application**
   - Running either within the same Kubernetes cluster or in a separate environment, integrated with ReportPortal for reporting test results.

### Diagram Example

![AWS EKS ReportPortal Architecture](https://www.example.com/your-architecture-diagram)  *Note: Please replace this URL with the actual link to your architecture diagram if you're sharing it.*

### Visual Representation with Tool

Use a diagramming tool to create the architecture diagram with the following steps:

1. **Draw the AWS Account boundary.**
2. **Inside the AWS Account, create a VPC box.**
3. **Within the VPC, draw two subnets (public and private).**
4. **Place an Internet Gateway and a NAT Gateway inside the public subnet.**
5. **Draw the EKS Cluster inside the public subnet.**
6. **Inside the EKS Cluster, depict the Node Groups.**
7. **Within the Node Groups, illustrate the Helm Chart deployment components:**
   - ReportPortal UI (with a LoadBalancer service)
   - ReportPortal API
   - PostgreSQL
   - RabbitMQ
   - MinIO
8. **Add connections between components, showing interactions (e.g., API calls, database connections).**
9. **Include Security Groups around the VPC, EKS Cluster, and individual components where relevant.**
10. **Depict the Spring Boot Application and its integration with ReportPortal.**

### Tools for Diagram Creation
- **draw.io**: Free and easy-to-use online diagramming tool.
- **Lucidchart**: Paid tool with more advanced features and integrations.
- **Microsoft Visio**: Another powerful diagramming tool, especially for enterprise environments.

---

This architecture diagram and description will help your client understand the overall setup and the interaction between different components in the system. Feel free to customize the diagram to match your specific configurations and deployment setup.
