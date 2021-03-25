kubectl run kaniko -n build \
--rm --stdin=true \
--image=gcr.io/kaniko-project/executor:latest --restart=Never \
--overrides='{
  "apiVersion": "v1",
  "spec": {
    "containers": [
      {
        "name": "kaniko",
        "image": "gcr.io/kaniko-project/executor:latest",
        "stdin": true,
        "stdinOnce": true,
        "args": [
          "--dockerfile=Dockerfile",
          "--context='"$(git config remote.origin.url | sed -r 's/https/git/g')"'",
	  "--git=branch='"$(git rev-parse --abbrev-ref HEAD)"'",
          "--destination=luizhpriotto/kaniko-demo:'"$(git rev-parse --abbrev-ref HEAD)"'"
        ],
        "volumeMounts": [
          {
            "name": "docker-config",
            "mountPath": "/kaniko/.docker/"
          }
        ]
      }
    ],
    "volumes": [
      {
        "name": "docker-config",
        "projected": {
           "sources": [
             {
               "secret": {
                 "items": [
                   {
                     "key": ".dockerconfigjson",
                     "path": "config.json"
                   }
                 ],
                 "name": "regcred"
               }
             }
           ]
        }
      }
    ]
  }
}'
