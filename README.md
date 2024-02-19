# GitHub Actions demos

Hello developer 👋, this repo contains some demos around GitHub Actions.

<details>
<summary> <h2>GitHub Actions Importer</h2></summary>

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
gh actions-importer forecast jenkins --output-dir tmp/forecast
```
> [!WARNING]
> The 'Paginated Builds' plugin (https://plugins.jenkins.io/paginated-builds) must be installed on your Jenkins server prior to running the `forecast` command.

## Dry run the migration of Jenkins to GitHub Actions

```bash
gh actions-importer dry-run jenkins --source-url http://jenkins:8080/job/job-from-jenkins --output-dir tmp/dry-run
``` 

## Migrate Jenkins to GitHub Actions

```bash
gh actions-importer migrate jenkins --source-url http://jenkins:8080/job/job-from-jenkins --output-dir tmp/migrate --target-url https://github.com/returngis/tour-of-heroes-gh-actions
```
</details>

<details>
  
<summary><h2>GitHub Packages</h2></summary>
</details>

<details>
  <summary><h2>Secrets</h2></summary>

  You can create secrets at three levels: Repository, environment and organization.

You can create them using the UI in your Repository > Settings or your Organization > Settings. You can also use GitHub CLI:

```bash
gh secret set SECRET_NAME
```
or

```bash
gh secret set SECRET_NAME < secret.txt
```

Secrets cannot be directly referenced in if: conditionals. Instead, consider setting secrets as job-level environment variables, then referencing the environment variables to conditionally run steps in the job. 

If you must pass secrets within a command line, then enclose them within the proper quoting rules. Secrets often contain special characters that may unintentionally affect your shell. To escape these special characters, use quoting with your environment variables.

You can store up to 1,000 organization secrets, 100 repository secrets, and 100 environment secrets.

All 100 repository secrets.

If the repository is assigned access to more than 100 organization secrets, the workflow can only use the first 100 organization secrets (sorted alphabetically by secret name).
All 100 environment secrets.

Secrets are limited to 48 KB in size. To store larger secrets, see the "Storing large secrets" workaround below.

### Generate a secret larger than 48KB

```bash
larger_secret=$(printf 'a%.0s' {1..49153})  # Create a string of 48KB + 1B
echo ${#larger_secret}  # Print string lengh

gh secret set LARGER_SECRET --body $larger_secret
```

To use secrets that are larger than 48 KB, you can use a workaround to store secrets in your repository and save the decryption passphrase as a secret on GitHub. For example, you can use gpg to encrypt a file containing your secret locally before checking the encrypted file in to your repository on GitHub. For more information, see the "gpg manpage."

</details>
