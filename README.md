# AWS Cloud Resume Challenge Project
[My Cloud Resume 🔗](https://resume.qhowell.cloud)

## Blog Series
[Navigating the AWS Cloud Resume Challenge](https://dev.to/qdiddypop/navigating-the-aws-cloud-resume-challenge-lessons-learned-37l2)


## Overview
[The Cloud Resume Challenge](https://cloudresumechallenge.dev/docs/the-challenge/aws/) is a multi-step resume project tailored to exhibit and enhance fundamental skills necessary for pursuing a career in cloud computing. This endeavor showcases your competence in constructing a secure static website with a visitor counter, utilizing various AWS services and infrastructure. Successfully accomplishing this challenge equips you with hands-on proficiency in AWS, CloudFront, Lambda, DynamoDB, GitHub Actions, Terraform, and other key technologies.

### Architecture

![Architecture Diagram](/img/AWS1.drawio.png)

#### Prerequisites
Before you begin, make sure you have the following in place:
- An AWS account.
- AWS CLI installed and configured.
- GitHub repository for your project.
- Terraform installed locally.

##### File Management
Organize your project files:
- Backend: Contains Terraform code for backend infrastructure.
- Frontend: Contains your static website files.
- .github/workflows: Contains GitHub Actions workflow files.

Customize your website:
- Add your website content to the frontend folder.
- Customize the HTML and CSS to match your design.

Backend CI/CD
- Configure CI/CD for the backend infrastructure using GitHub Actions.
- Utilize Terraform to manage your backend infrastructure.
- Use GitHub Secrets to store sensitive information securely.

Frontend CI/CD
- Set up CI/CD for your frontend static website using GitHub Actions.
- Automate the deployment of your website using AWS services like S3, CloudFront, and Lambda.

###### Getting Started

1. Set Up AWS Services
- Create an S3 bucket for your static website.
- Create a DynamoDB table for visitor counts.
- Create an AWS Lambda function for visitor count logic.
- Create an S3 bucket for your Terraform state files.

2. Configure AWS Access
- Make sure your AWS CLI is configured with access to the created services.

3. GitHub Actions
- Configure GitHub Secrets with your AWS access keys and other necessary information.

4. Terraform
- Adjust the terraform.tfvars file to match your AWS resources.
- Initialize Terraform.

5. Deploy the Website
- Upload your website to the S3 bucket.
- Configure AWS CloudFront for your website.
- Set up SSL with AWS Certificate Manager.

6. Add the Visitor Counter to Your Website
- Add the necessary JavaScript code to your website.
- Deploy your updated website.

7. Security

Enhance the security of your project by implementing various security headers, content security policies, and access controls.

## Author
- LinkedIn: [Quentin Howell](https://www.linkedin.com/in/quentin-howell-7477636a/)

License

This project is licensed under the MIT License - see the LICENSE file for details.

Acknowledgments

AWS Cloud Resume Challenge

html5up




