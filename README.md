A docker container which is designed to interact with Docker on the host machine for Azure Pipelines agents.

# Run the container

Edit the following command then run it with the following variables set:

| Variable | Example                       | Description                                                                                                                                                                                                                                                                             |
|----------|-------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| AZP_URL  | https://dev.azure.com/contoso | The organisation name from Azure. When you sign into Azure DevOps, the organisations are on the left menu (or in the hamburger menu at the top left if you are using a mobile for some reason)                                                                                          |
| AZP_PAT  | <PAT Token>                   | Your PAT token for Azure DevOps. You can find out how to make one by following the Authenticate with a personal access token (PAT) section of https://docs.microsoft.com/en-us/azure/devops/pipelines/agents/v2-windows?view=azure-devops#authenticate-with-a-personal-access-token-pat |
| AZP_POOL | Windows Agent Pool                    | The name of the pool as seen in Project > Project Settings > Agent Pools. This may include spaces.                                                                                                                                                                                      |

Here's a command you can edit as needed to run the container:

```
docker service create \
    --env AZP_URL="<URL>" \
    --env AZP_TOKEN="<PAT>" \
    --env AZP_POOL="<Pool Name>" \
    --replicas=<replicas> \
    --mount type=npipe,source="\\.\pipe\docker_engine\",destination="\\.\pipe\docker_engine\" \
    --mount type=volume,source="C:\Program Files\Docker",destination="C:\Program Files\Docker" \
    dockeragent:latest
```

Or use the docker-compose file to spawn the containers.
