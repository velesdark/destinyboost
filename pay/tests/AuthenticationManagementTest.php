<?php
ini_set('error_reporting', E_ALL);
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);


echo '123';

namespace SafeCharge\Tests;

/*use SafeCharge\Api\Service\AuthenticationManagement;

/*class AuthenticationManagementTest extends \PHPUnit_Framework_TestCase
{
    private $_service;

    public function __construct()
    {
        $this->_service = new AuthenticationManagement(TestCaseHelper::getClient());
    }

    public function testGetSessionToken()
    {
        $response = $this->_service->getSessionToken(['clientRequestId' => "15"]);
        $this->assertContains('sessionToken', $response);
        $this->assertEquals('SUCCESS', $response['status']);
    }

}
*/