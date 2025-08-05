#! /bin/zsh

machine() {
  fly m list -q | head -n 1 | xargs
}

fly m destroy "$(machine)" --force
fly m create gitea/gitea:1.24.3 --entrypoint "/bin/bash -c 'until false; do sleep 10; done;'" -v 'vol_4qgx8jxjq7p35znv:/data'
fly m start "$(machine)"
fly ssh console
fly m destroy "$(machine)" --force
fly deploy
