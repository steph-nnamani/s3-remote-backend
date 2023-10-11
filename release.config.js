module.exports = {
branches: "main"
repositoryUrl: "https://github.com/steph-nnamani/s3-remote-backend.git/s3-module"
plugins: [
'@semantic-release/commit-analyzer',
'@semantic-release/release-notes-generator',
'@semantic-release/git',
'@semantic-release/github']
}