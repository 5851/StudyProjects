MODULE_SRC=HomeWork8/Modules/NewsAPINetwork/Sources/NewsAPINetwork
openapi-generator generate -i swagger.yml -g swift5 -o api-mobile
rm -r $MODULE_SRC""*
cp -R api-mobile/OpenAPIClient/Classes/OpenAPIs/. $MODULE_SRC
rm -r api-mobile
