MODULE_SRC=TransportPortal/Modules/NewsApiNetwork/Sources/NewsApiNetwork
openapi-generator generate -i swagger.yml -g swift5 -o api-mobile
rm -r $MODULE_SRC""*
cp -R api-mobile/OpenAPIClient/Classes/OpenAPIs/. $MODULE_SRC
rm -r api-mobile
