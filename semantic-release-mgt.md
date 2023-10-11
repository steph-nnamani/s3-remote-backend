AUTOMATE RELEASES
=================
cd s3-backend
PREREQUISITE: Node.js and npm are installed on your system.
-------------
Install Node.js and npm
Node.js® is an open-source, cross-platform JavaScript runtime environment.
Download -> website: https://nodejs.org/

1. Install the semantic-release on the environment:
   npm install --save-dev semantic-release
   $ npm install semantic-release @semantic-release/git @semantic-release/github -D

2. Create a config file (release.config.js) in the project (s3-backend) with the contents below:

Our Project directory refers: Our local machine git repo > s3-backend
----------------------------

release.config.js
===================

module.exports = {
branches: "main"
repositoryUrl: "https://github.com/<repository-where you want to make release from>"
plugins: [
'@semantic-release/commit-analyzer',
'@semantic-release/release-notes-generator',
'@semantic-release/git',
'@semantic-release/github']
}

3. Add your project to the repo:
   git add .               #This downloads all modules needed for semantic versioning

4. Commit your project to the repo using conventional commits. 
Your commit messages should be either

fix:                     ...........for a patch version
feat:                    ...........for a minor version
BREAKING CHANGE:         ...........for a major version

5. Create a workflow inside the same project repo (s3-backend):
   .github/workflows/release.yaml
   Add step in the CI workflow:

name: release
on: [workflow_dispatch]         #manual trigger
#This is for manual releases. Go to Github > Actions > Run workflow
jobs:
  release:
    permissions:
    contents: write
    issues: write
    pull-requests: write
  runs-on: ubuntu-latest
  steps:
    - name: checkout
      uses: actions/checkout@v3
    - name: release
      run: npx semantic-release
      env:
        GITHUB_TOKEN: ${{secrets.GITHUB_TOKEN}}


# save
git add .
git commit -m "fix: semantic release for bug fixed"     #customize for requirement
git push

#For manual releases. Go to Github > Actions > All workflows
> release > Run workflow

Project/Ticket 001: ADD A NEW FEATURE TO THE S3 BUCKET
==================
FEATURE:
Enable versioning on the s3 bucket module.
Ref Directory/folder: s3-module

Solution:
Step 1.
From terraform documentation, copy s3 bucket
versioning block and add to the/update the

#s3-backend/s3.tf
resource "aws_s3_bucket" "backend" {
bucket = "bootcamp32-${lower(var.env)}-${random_integer.backend.result}"
#lower converts all cased letters in the given string to lowercase
tags = {
Name        = "backend"
Environment = "Dev"
}
}


#terraform s3 bucket versioning enabled block
resource "aws_s3_bucket_versioning" "versioning_example" {
bucket = aws_s3_bucket.example.id
versioning_configuration {
status = "Enabled"
}
}

# We will create a variable for the versioning status
Step 2. Update the variable.tf
variable "versioning_status" {
type = string
default = "Eabled" # You can set a default value if desired
description = "The status of versioning for the S3 bucket."
}

updated s3-module/s3.tf
=======================
resource "aws_s3_bucket" "backend" {
bucket = "bootcamp32-${lower(var.env)}-${random_integer.backend.result}"
#lower converts all cased letters in the given string to lowercase
tags = {
Name        = "backend"
Environment = "Dev"
}
}
resource "aws_s3_bucket_versioning" "versioning_example" {
bucket = aws_s3_bucket.backend.id
versioning_configuration {
status = var.versioning_status
}
}

Step 3.
git add .
git commit -m "feat: This is a new feature"
git push      # This will create a new version
v1.1.0

