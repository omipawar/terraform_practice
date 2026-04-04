# terraform_practice

### Refer to setup AWS CLI and Terraform
```bash
https://github.com/omipawar/setup_scripts
```

## To manage the resources based on environments like dev, stagging and prod, Use terraform workspaces with git
### Workspace to seperate the state files and git to seperate the infra code and its environment
```bash
1. Here the main branch containes code for prod env in which the state file is mapped with default workspace
2. And dev branch containes dev env code and workspace is dev
```
