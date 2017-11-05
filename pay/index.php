<?php
ini_set('error_reporting', E_ALL);
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
require_once('init.php');

use SafeCharge\Api\Utils;

$client = new \SafeCharge\Api\RestClient([
    'environment' => \SafeCharge\Api\Environment::TEST,
    'hashAlgorithm' => 'sha256',
    'merchantId' => '4398371783281359887',
    'merchantSiteId' => '143503',
    'merchantSecretKey' => 'DvFFuHkmUznPJ9PFyMdvNXi9DZ5TtxL2LDGsCvBZ5Zsc9J4KGvpTtgUr68gPCBjd',
]);

$authenticationService = new \SafeCharge\Api\Service\AuthenticationManagement($client);

$authenticationResponse = $authenticationService->getSessionToken([
    'clientRequestId' => '345435435345'
]);
?>


<?
//require_once('init.php');

/*$client = new \SafeCharge\Api\RestClient([
    'environment'       => \SafeCharge\Api\Environment::TEST,
    'merchantId'        => '4398371783281359887',
    'merchantSiteId'    => '143503',
    'merchantSecretKey' => 'DvFFuHkmUznPJ9PFyMdvNXi9DZ5TtxL2LDGsCvBZ5Zsc9J4KGvpTtgUr68gPCBjd',
]);*/
/*$client = new \SafeCharge\Api\RestClient();
$config = $client->getConfig();
$config->setEnvironment(\SafeCharge\Api\Environment::TEST);
$config->setMerchantId('4398371783281359887');
$config->setMerchantSiteId('143503');
$config->setMerchantSecretKey('DvFFuHkmUznPJ9PFyMdvNXi9DZ5TtxL2LDGsCvBZ5Zsc9J4KGvpTtgUr68gPCBjd');

$authenticationService = new \SafeCharge\Api\Service\AuthenticationManagement($client);

$authenticationResponse = $authenticationService->getSessionToken([
    'clientRequestId' => '123123'
]);*/
/*
use \SafeCharge\Api\Service\AuthenticationManagement;
class AuthenticationManagementTest extends AuthenticationManagement
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

}*/
/*use \SafeCharge\Api\Service\AuthenticationManagement\TestCaseHelper;
use \SafeCharge\Api\Service\AuthenticationManagement;
use \SafeCharge\Api\Service\AuthenticationManagement;
$service = new AuthenticationManagement(TestCaseHelper::getClient());*/

?>