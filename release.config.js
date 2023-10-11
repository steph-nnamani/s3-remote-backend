module.exports = {
  branches: "main",
  repositoryUrl: "https://github.com/steph-nnamani/s3-remote-backend.git",
  plugins: [
    "@semantic-release/commit-analyzer",
    "@semantic-release/release-notes-generator",
    "@semantic-release/git",
    "@semantic-release/github"
  ]
};
