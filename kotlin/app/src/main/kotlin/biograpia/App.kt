/*
 * This Kotlin source file was generated by the Gradle 'init' task.
 */
package biograpia

import software.amazon.awssdk.services.sts.StsClient
import software.amazon.awssdk.services.sts.auth.StsAssumeRoleCredentialsProvider
import software.amazon.awssdk.services.sts.model.AssumeRoleRequest

fun main() {

    val ROLE_ARN: String = System.getenv("ROLE_ARN")
    val SESSION_NAME: String = System.getenv("SESSION_NAME")
    assumeRole(ROLE_ARN, SESSION_NAME)
}

fun assumeRole(roleArn: String, sessionName: String) {

    val req: AssumeRoleRequest = AssumeRoleRequest.builder()
            .roleArn(roleArn).roleSessionName(sessionName).build()

    val provider: StsAssumeRoleCredentialsProvider = StsAssumeRoleCredentialsProvider.builder()
            .stsClient(StsClient.builder().build())
            .refreshRequest(req).build()

    val client: StsClient = StsClient.builder().credentialsProvider(provider).build()

    println(client.getCallerIdentity())
}
