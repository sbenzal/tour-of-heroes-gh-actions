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

# How to configure GitHub Actions and Jenkins

```bash
gh actions-importer configure
```

It will ask:

- Which CI providers are you configuring?: `Jenkins`
- Personal access token for GitHub: You can ask for a token to GitHub CLI
- Base url of the GitHub instance: `https://github.com`
- Personal access token for Jenkins:
- Username of Jenkins user: gis
- Base url of the Jenkins instance: `http://localhost:8080`