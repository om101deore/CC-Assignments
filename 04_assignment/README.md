# 4. Deploy static Web application using AWS S3 service
- Name:     Om Deore
- PRN:      22110318
- Div:      TY(A)
- RollNo:   321022
- github: [All Assignments](https://github.com/om101deore/CC-Assignments) 


##### What is S3 service of AWS
AWS S3 stands for Amazon Simple Storage Service. It is a cloud-based storage service that can scale to an enormous size and provide high performance, availability, reliability, and security. It is a very cost-effective and secure replacement for your on-premises data center. The data is stored on cloud servers can be accessed through other web applications and websites globally.

Apart from data storage functionality, the AWS S3 bucket provides a remarkable feature of static website hosting over it.

##### Hosting a static website on Amazon S3
A website that doesn't involve server side communication is called a static website. Using S3 bucket we can host our static website in simple and easy steps.

**Step 1: Create an S3 bucket**
To create a S3 bucket first login to your AWS management console, search of S3 in services and click on that option. Next click on create bucket. You will be greeted with following form.
In this tab give your bucket unique name. Keep other options as default.

![[01_create_bucket.png]]

Since we wanted the website to be accessible to the audience, we had to grant the public access to the objects of this S3 bucket. For that, uncheck the Block all public access checkbox in the “Block Public Access setting for this bucket” section:
![[02_public_access.png]]

Keep other options default and click on "Create bucket"
![[03_other_default.png]]

Now you can go to your buckets and see our recently created bucket being seen in list.

![[04_buckets.png]]

**Step 2: Uploading contents of your website to S3 bucket**
After creating bucket, it's time to upload our website on this storage we just created. Select the bucket. Go to objects tab. And click on upload. With this we can add our files to S3 bucket.

![[05_objects_in_bucket.png]]

After clicking on upload, click on "Add Folder" button. It will prompt you to select the folder of our website
![[06_folder.png]]

Now we can see files of our webpage.


![[07_files.png]]

After clicking on "Upload", you see uploading being initiated. Once it is done your files are saved on this S3 bucket.

![[08_uploading.png]]

**Step 3: Setting up static web hosting in S3**
After uploading static site content, enable hosting on your S3 bucket. For this go to properties tab in current bucket. Scroll down and click edit on Static website hosting option.
![[09_static_web_hosting.png]]

Select option to enable static website hosting
![[10_edit_static_website.png]]

Now, our S3 bucket is hosting the website content uploaded to it and is publicly accessible. In order to access the website, we need a public URL that AWS itself provides. This URL can be seen in the static website hosting section of the S3 bucket:
![[11_link.png]]

Go to the URL provided by S3, and the website will not be accessible because we have made the S3 bucket public, but the objects inside the S3 bucket are not public yet. This problem can be solved by using the S3 bucket policies.
![[12_forbidden.png]]
**Step 4: setting up permissions in S3 bucket**
To make our content accessible publicly, we need to add a bucket policy for which we have to go to the permissions tab of our S3 bucket to make some changes to the permissions of our S3 bucket:
![[13_permissions.png]]

Now, move to the bucket policy section and click on the **Edit** button. 
![[14_bucket_policy.png]]

Paste the following JSON in the editor to allow the public to read files from the bucket 
```json
{  
    "Version": "2012-10-17",  
    "Statement": [  
        {  
            "Sid": "PublicRead",  
            "Effect": "Allow",  
            "Principal": "*",  
            "Action": [  
                "s3:GetObject",  
                "s3:GetObjectVersion"  
            ],  
            "Resource": "arn:aws:s3:::cc-assignment-static-website/*"  
        }  
    ]  
}
```

Click on save changes to continue.
![[15_set_permissions.png]]

**Step 5: Accessing the Website Through URL**
Now we are ready to get our URL to index.html file and see our hosted website. Go to "Objects" tab and navigate to `index.html` file. Click on it
![[16_index_html.png]]

Here you can see object url. Click on it to visit your webpage you just hosted.

![[17_index_html_url.png]]

You can see website being hosted on laptop and mobile browser
![[18_website_hosted.png]]


![[19_website_hosted.jpeg|300]]