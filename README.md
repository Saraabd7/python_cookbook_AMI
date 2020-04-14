# python_cookbook_AMI

This cookbook was created in the aim to have all the dependencies required to run the python app, Jenkins configured been used.

## Chef
The chef was used to creating a cookbook using chef generate cookbook python_cookbook_AMI and it contains the dependencies in the recipe needed to run the IT_Jobs_Watch_Data.

## Berksfile
Berksfile contains the chef supermarket and the metadata and is used to manage the dependencies of the cookbook and a berks-cookbooks berks vendor.

## Packer
Packer is used to creating immutable images of our machines. packer has been used to create an AMI in AWS.  The configuration of this specified in the packer.json.

## Creating an image
To create an image, when in the python_cookbook_AMI, in the command line type:

- Packer build packer.json
- Using Jenkins
- Running Jenkins
- Launch an instance using the AMI created, name of AMI is specified in the packer.json file

When the instance has been created got to port 8080 on the IP address(xxx.xxx.xxx.xxx) so in the web browser you should have xxx.xxx.xxx.xxx:8080.

It should then take to a page where you have to input a password

 Enter the machine using the key(key_name.pem) specified in packer.json and the IP address(xxx.xxx.xxx.xxx) generated. In the command line type:

```
ssh -i ~/location/of/key/key_name.pem ubuntu@xxx.xxx.xxx.xxx
```

* To get access to the password input the following code:

```sudo cat /var/lib/Jenkins/secrets/initialAdminPassword
```
```f99bbdf443534aa8a70de5bf04606060 copy the password and unlock jenkins.
```
***CONGRATS! JENKINS IS SUCCESSFULLY INSTALLED!!***

 After that should have access to Jenkins. Install the plugins already given and complete the login details.

## Installing plugins
On the next screen, Jenkins will ask to set up default plugins or choose from a list of plugins. Setup the defaults to start. After that check, GitHub plugin installed by going to Jenkins --> manage Jenkins --> manage plugins and install the GitHub plugin.

## Creating a build
1. Go to Jenkins --> New Item
2. Enter a name and choose a freestyle project
3. Source Code Management
4. Put the ssh of the GitHub project

- Create a key Using ssh-keygen -t rsa on your computer, and in GitHub project under deploy keys add the public key that you generated.
- In Jenkins go to add key and from there change the kind to 'SSH Username with private key', add a username and manually add the private key generated.

## Build triggers
Choose 'GitHub hook trigger for GITScm polling'

On the GitHub project, under webhooks add a new webhook. Have the payload URL as https://xxx.xxx.xxx.xxx:8080/github-webhook/ and change the content type to application/JSON. So now whenever a change is made to the GitHub project it will trigger this Jenkins build.

## Build
Choose execute a shell and type the following code:

```
sudo chmod 777 /home/ubuntu/Downloads
cd app
pip3 install -r requirements.txt
sudo python3 -m pytest tests/

```
## Run the build
To start the build simply select Build Now. If the output is blue it is successful. If it is red means it was unsuccessful and should select the console output to find out the error.
