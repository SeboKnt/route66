#!/bin/bash

docker buildx build \
  --platform linux/amd64 \
  --cache-from type=local,src=/workspaces/route66/tmp/amd64 \
  --cache-to type=local,dest=/workspaces/route66/tmp/amd64 \
  --tag seboknt/66:amd64 \
  --file DOCKERFILE .

echo "-------------------------------------------------------------------------------------------------------"

docker buildx build \
  --platform linux/arm64 \
  --cache-from type=local,src=/workspaces/route66/tmp/arm64 \
  --cache-to type=local,dest=/workspaces/route66/tmp/arm64 \
  --tag seboknt/66:arm64 \
  --file DOCKERFILE .

echo "-------------------------------------------------------------------------------------------------------"

docker buildx build \
  --platform linux/amd64,linux/arm64 \
  --cache-from type=local,src=/workspaces/route66/tmp/amd64 \
  --cache-from type=local,src=/workspaces/route66/tmp/arm64 \
  --tag seboknt/66:dev \
  --file DOCKERFILE .