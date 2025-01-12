def buildApp(){
  echo "111111111111111111 building the application >${params.TOAS}< - from groovy script..."
}

def testdApp(){
  echo "222222222222222222 testing the application - from groovy script..."
  echo "222222222222222222 testing the application v${NEW_VERSION} - from groovy script..."
}

def deployApp(){
  echo "333333333333333333 deploying the application - from groovy script..."
  echo "333333333333333333 deploying the application v${params.VERSION} - from groovy script..."
}

return this
