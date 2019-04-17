# Expo - Semantic Release for GitHub Actions

GitHub actions for [byCedric/semantic-release-expo][semantic-release-expo]

## Sample configuration
You can use the sample configuration below to:
- Generate release notes
- Prepare a `CHANGELOG.md`
- Update the version in `package.json` and `app.json`
- Publish a release to Github

Start by adding the semantic-release plugins:
```
yarn add @semantic-release/changelog @semantic-release/git @semantic-release/github @semantic-release/npm @semantic-release/release-notes-generator -D
```

Next, add the configuration to your `package.json`:
```
  "release": {
    "verifyConditions": [
      "semantic-release-expo",
      "@semantic-release/changelog",
      "@semantic-release/git",
      "@semantic-release/github",
      "@semantic-release/npm"
    ],
    "generateNotes": [
      "@semantic-release/release-notes-generator"
    ],
    "prepare": [
      "semantic-release-expo",
      "@semantic-release/changelog",
      "@semantic-release/npm",
      {
        "path": "@semantic-release/git",
        "assets": [
          "CHANGELOG.md",
          "package.json",
          "package-lock.json",
          "app.json"
        ]
      }
    ],
    "publish": [
      "@semantic-release/github"
    ],
    "success": false,
    "fail": false
  },
```

Finally, in your `main.workflow`, add this action:
```
action "semantic-release" {
  uses = "mgibeau/semantic-release-expo-github-action"
  secrets = ["GITHUB_TOKEN"]
}
```

## Environment variables
Most [semantic-release][semantic-release] plugins support configuration through [environment variables][semantic-release-env].

## Secrets
If you plan to use [@semantic-release/git][semantic-release-git] or [@semantic-release/github][semantic-release-github], make sure
that you are using `GITHUB_TOKEN`.

Other [authentication methods][semantic-release-autentication] can also be defined using secrets.

## Required arguments
N/A

## Optional arguments
N/A

[semantic-release]: https://github.com/semantic-release/semantic-release
[semantic-release-expo]: https://github.com/byCedric/semantic-release-expo
[semantic-release-env]: https://github.com/semantic-release/semantic-release/blob/master/docs/usage/configuration.md#git-environment-variables
[semantic-release-git]: https://github.com/semantic-release/git
[semantic-release-github]: https://github.com/semantic-release/github
[semantic-release-autentication]: https://github.com/semantic-release/semantic-release/blob/master/docs/usage/ci-configuration.md#authentication