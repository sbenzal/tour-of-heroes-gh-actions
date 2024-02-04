# GitHub Actions demos

Hello developer 👋, this repo contains some demos of GitHub Actions. I use this repo to test and learn about GitHub Actions.

# GitHub Actions Importer

First things first, let's talk about the GitHub Actions Importer. You need GitHub CLI to use this feature. In this repo, if you open it as a Dev Container, you will have GitHub CLI installed. 

```bash
gh auth login
```

The second thing you need is to install the GitHub Actions Importer CLI extension:

```bash
gh extension install github/gh-actions-importer
```

Now you can test GitHub Actions Importer.

```bash
gh actions-importer -h
```

Print GITHUB_TOKEN to use in the next steps:

```bash
gh auth token
```


# How to configure GitHub Actions and Jenkins

```bash
gh actions-importer configure
```

It will ask:

- Which CI providers are you configuring?: `Jenkins`
- Personal access token for GitHub: `Paste previously copied GITHUB_TOKEN`
- Base url of the GitHub instance: `https://github.com`
- Personal access token for Jenkins: Profile > Configure > API Token > Generate (ex: `11c23b8096add8412cfb4b3c85a0ada753`)
- Username of Jenkins user: gis
- Base url of the Jenkins instance: `http://jenkins:8080`

## Perform an audit of Jenkins

First we need to fetch the latest image of github actions importer:

```bash
gh actions-importer update
```

```bash
gh actions-importer audit jenkins --output-dir tmp/audit
```

## Forecast the migration of Jenkins to GitHub Actions

```bash
# The 'Paginated Builds' plugin (https://plugins.jenkins.io/paginated-builds) must be installed on your Jenkins server prior to running the `forecast` command
gh actions-importer forecast jenkins --output-dir tmp/forecast
```
## Dry run the migration of Jenkins to GitHub Actions

```bash
gh actions-importer dry-run jenkins --source-url http://jenkins:8080/job/job-from-jenkins --output-dir tmp/dry-run
``` 

## Migrate Jenkins to GitHub Actions

```bash
gh actions-importer migrate jenkins --source-url http://jenkins:8080/job/job-from-jenkins --output-dir tmp/migrate --target-url https://github.com/giselat_microsoft/tour-of-heroes-jenkins-demo
```