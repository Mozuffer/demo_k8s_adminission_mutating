APP  = mutate
NAMESPACE = default

.PHONY:cert clean 

all: secret

cert: 
	@./ssl.sh $(APP) $(NAMESPACE)
secret: cert               
	kubectl create secret tls $(APP) --cert=$(APP).pem --key=$(APP).key

clean: 
	rm -rf *.key *.pem *.crt *.csr csr.conf
	kubectl delete secret $(APP)
	kubectl delete csr $(APP).$(NAMESPACE).svc
