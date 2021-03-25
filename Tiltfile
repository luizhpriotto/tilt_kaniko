docker_compose('docker-compose.yml')

custom_build(
  # Image name - must match the image in the docker-compose file
  'luizhpriotto/kaniko-demo:main',
  #custom command
  './kaniko.sh',
  # Docker context
  '.',
  tag='main',
  live_update = [
    # Sync local files into the container.
    sync('.', '/var/www/app'),

    # Re-run npm install whenever package.json changes.
    run('npm i', trigger='package.json'),

    # Restart the process to pick up the changed files.
    #restart_container()
  ])
