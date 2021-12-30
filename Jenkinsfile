@Library(['manheim-terraform-pipeline@v5.18', 'demo-tf-customization@0.4']) _

properties ([
    [
      $class: 'BuildDiscarderProperty',
      strategy: [$class: 'LogRotator', numToKeepStr: '10']
    ]
])

Jenkinsfile.init(this, Customizations)
ValidateFormatPlugin.init()
WithAwsPlugin.withRole().init()

ConditionalApplyPlugin.withApplyOnBranch('main')

TerraformEnvironmentStage
            .withGlobalEnv("PROJECT", "demo")
            .withGlobalEnv("region", "ap-southeast-1")

def validate = new TerraformValidateStage()
// We only have NonProd and Prod in the UCI project, in this project "QA" (library preferred) refers to "Non prod".
def deployDev = new TerraformEnvironmentStage('dev')
def deployQA =new TerraformEnvironmentStage('qa')

validate.then(deployDev)
        .then(deployQA)
        .build()
