CAPABILITIES=CAPABILITY_IAM CAPABILITY_AUTO_EXPAND
REGION=us-east-1



deploy-dapp: STACK_NAME = keep-test
deploy-dapp: PARAMETERS_FILE = template-config.staging.json
deploy-dapp: PARAMETERS = $(shell cat $(PARAMETERS_FILE) | jqn 'get("Parameters") | entries | map(x => x[0] + "=" + x[1]) | join(" ")')
deploy-dapp:
	sam deploy --template-file frontend.yml --stack-name $(STACK_NAME) --capabilities $(CAPABILITIES)  --region $(REGION) --parameter-overrides $(PARAMETERS)


deploy-dashboard: STACK_NAME = keep-dashboard
deploy-dashboard: PARAMETERS_FILE = template-config.dashboard.json
deploy-dashboard: PARAMETERS = $(shell cat $(PARAMETERS_FILE) | jqn 'get("Parameters") | entries | map(x => x[0] + "=" + x[1]) | join(" ")')
deploy-dashboard:
	sam deploy --template-file frontend.yml --stack-name $(STACK_NAME) --capabilities $(CAPABILITIES)  --region $(REGION) --parameter-overrides $(PARAMETERS)
