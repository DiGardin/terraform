# Creates S3 bucket and two corresponding (IAM) policies - Read only and Read Write

The script creates new bucket and automatically creates to new polcies based on bucket name:

User will be prompted with AWS profile name (credentails) and Bucket name.

## Script will generate policies based of Bucket name: 
For example: if you enter bucket name as *ww-analytics*: two policies will be created:
###*s3-read_ww-analytics*
###*s3_read_write_ww-analytics*