IMAGE_TAG ?= latest

requirements:
	ansible-galaxy install -r requirements.yml

setup:
	ansible-playbook --vault-password-file ./vault-password-file playbook.yml -i inventory.yml

deploy:
	ansible-playbook --vault-password-file ./vault-password-file deploy.yml -i inventory.yml -e "image_tag=$(IMAGE_TAG)"