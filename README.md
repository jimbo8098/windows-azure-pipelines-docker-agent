A docker container which is designed to interact with Docker on the host machine for Azure Pipelines agents.

# Run the container

Edit the following command then run it with the `<placeholders>` filled in as below:

| Variable  | Description                                                                                                                                                                                                                                                                             |
|-----------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| org       | The organisation name from Azure. When you sign into Azure DevOps, the organisations are on the left menu (or in the hamburger menu at the top left if you are using a mobile for some reason)                                                                                          |
| PAT       | Your PAT token for Azure DevOps. You can find out how to make one by following the Authenticate with a personal access token (PAT) section of https://docs.microsoft.com/en-us/azure/devops/pipelines/agents/v2-windows?view=azure-devops#authenticate-with-a-personal-access-token-pat |
| Pool Name | The name of the pool as seen in Project > Project Settings > Agent Pools. This may include spaces.                                                                                                                                                                                      |


```
docker service create \
    --env AZP_URL="https://dev.azure.com/<org>" \
    --env AZP_TOKEN="<PAT>" \
    --env AZP_POOL="<Pool Name>" \
    --replicas=<replicas> \
    --mount type=npipe,source="\\.\pipe\docker_engine\",destination="\\.\pipe\docker_engine\" \
    --mount type=volume,source="C:\Program Files\Docker",destination="C:\Program Files\Docker" \
    dockeragent:latest
```