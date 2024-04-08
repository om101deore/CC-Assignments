# 3. Deploy Web application on AWS Cloud (or any cloud)
- Name:     Om Deore
- PRN:      22110318
- Div:      TY(A)
- RollNo:   321022


##### 1. What is cloud computing definition
> Cloud computing is the on-demand availability of computer system resources, especially data storage (cloud storage) and computing power, without direct active management by the user. Large clouds often have functions distributed over multiple locations, each of which is a data center. Cloud computing relies on sharing of resources to achieve coherence and typically uses a pay-as-you-go model, which can help in reducing capital expenses but may also lead to unexpected operating expenses for users.
\- Wikipedia

##### 2. Cloud service and deployment models
IaaS, PaaS and SaaS are the three most popular types of **cloud service** offerings. They are sometimes referred to as cloud service models or cloud computing service models.
   1) IaaS, or infrastructure as a service, is on-demand access to cloud-hosted physical and virtual servers, storage and networking—the backend IT infrastructure for running applications and workloads in the cloud.

   2) PaaS, or platform as a service, is on-demand access to a complete, ready-to-use, cloud-hosted platform for developing, running, maintaining and managing applications.

   3) SaaS, or software as a service, is on-demand access to ready-to-use, cloud-hosted application software.

The **cloud deployment** model identifies the specific type of cloud environment based on ownership, scale, and access, as well as the cloud’s nature and purpose.
**1) Public Cloud**
Anybody can access systems and services, infrastructure is owned by the entity that delivers the cloud services

**2) Private Cloud**
one-on-one environment for a single user (customer). There is no need to share your hardware with anyone else. The distinction between private and public clouds is in how you handle all of the hardware
The advantages of using a private cloud are as follows: 

**3) Hybrid Cloud**
By bridging the public and private worlds with a layer of proprietary software, hybrid cloud computing gives the best of both worlds. With a hybrid solution, you may host the app in a safe environment while taking advantage of the public cloud’s cost savings

**4) Community Cloud**
It allows systems and services to be accessible by a group of organizations. It is a distributed system that is created by integrating the services of different clouds to address the specific needs of a community, industry, or business.

**5) Multi-Cloud**
We’re talking about employing multiple cloud providers at the same time under this paradigm, as the name implies. It’s similar to the hybrid cloud deployment approach, which combines public and private cloud resources.

---

### 3) Step-by-step screenshot to upload web application on the cloud 
##### 1. Instance

Step 1: Login to [AWS console](https://aws.amazon.com/console/)

Step 2: go to ec2 and click on launch instace

Step 3: Give your instance a name and tags if required, choose what opearting system you want on your AWS server. Select CPU type 
Here we choose ubuntu 22.04.4 LTS as our OS and t3.micro for CPU type

![[01_aws_configurations.png]]


Step 4: Create a key pair to securely connect to your instance.

Step 5: Configure network security groups, storage and launch instance
![[02_aws_configurations.png]]

Once launched you can see it running in instances tab

![[03_Instances.png | 1000]]


Step 6: ssh into our AWS instance
To ssh into our instance we need to have our key at ready on local machine. Change permissions of that key.pem file to 400 so only current user can access it in read-only mode

 ```bash
$ chmod 400 key.pem 
```
To connect to your server use following command

```bash
$ ssh -i "cc_aws_key.pem" ubuntu@aws_server_dns.compute.amazonaws.com
```

this takes you into aws server's shell and prompt

![[04_connected_to_server_via_ssh.png]]


Step 7: Edit network security group permissions to allow traffic on http protocol's port
![[05_add_rule_to_security_grp.png]]

***
##### 2. LAMP installation

LAMP stands for
1. L - Linux for Operating system
2. A - Apache HTTP server
3. M - mysql for relational database management system
4. P - php, perl or python as programming language

We installed L in our linux server, let's install other three on this server too

step 1: Install rest of packages
```bash
$ sudo apt-get install apache2
$ sudo apt-get install mysql-server
$ sudo apt-get install php php-mysql
```

step 2: Change permissions of /var/www/html/ folder
```bash
$ sudo chmod 777 -R /var/www/html
```

##### 3. MySQL
step 3: Create a user in MySQL and give that user all database privileges
![[06_mysql_user.png]]


Step 4: Use the username and password of the user to open MySQL shell.
Create database and create a table in that database.
![[07_creating_table.png]]


##### 4. PHP
Now we need to copy our files in server's /var/www/html directory from our local machine. For this we use `scp` command. It allows use to share files via ssh protocol

Step 5: Secure copy our files (index.html) in server's /var/www/html directory

```bash
$ scp -i key.pem local_file.php ubuntu@aws_server_dns.com:/var/www/html/
```

![[08_scp_command.png]]

And thus we have deployed our web-application to AWS cloud and we can access this by putting AWS instance's DNS link in browser
![[09_website_on_browser.png]]![[10_on_mobile.jpeg | 300]]