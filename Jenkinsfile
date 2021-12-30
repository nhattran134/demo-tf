@Library(['manheim-terraform-pipeline@v5.18', 'demo-tf-customization@0.4']) _

properties ([
    [
      $class: 'BuildDiscarderProperty',
      strategy: [$class: 'LogRotator', numToKeepStr: '10']
    ]
])
sh 'who'
Jenkinsfile.init(this, Customizations)
ValidateFormatPlugin.init()
WithAwsPlugin.withRole().init()

ConditionalApplyPlugin.withApplyOnBranch('main')
TerraformEnvironmentStage
            .withGlobalEnv("PROJECT", "demo")
            .withGlobalEnv("region", "ap-southeast-1")

def validate = new TerraformValidateStage()
def deployDev = new TerraformEnvironmentStage('dev')
def deployQA =new TerraformEnvironmentStage('qa')

validate.then(deployDev)
        .then(deployQA)
        .build()
