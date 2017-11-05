<?php

namespace SafeCharge\Tests;

use SafeCharge\Api\Service\Payments\Void;

class VoidTest extends \PHPUnit_Framework_TestCase
{
    private $_service;

    public function __construct()
    {
        $this->_service = new Void(TestCaseHelper::getClient());
    }

    public function testVoidTransaction()
    {

        $transactionData = TestCaseHelper::createAndReturnTransaction(10, false);

        $params = [
            'clientRequestId' => '100',
            'clientUniqueId' => '12345',
            'amount' => "9.0",
            'currency' => 'EUR',
            'relatedTransactionId' => $transactionData['transactionId'],
            'authCode' => $transactionData['authCode'],
            'descriptorMerchantName' => 'Name',
            'descriptorMerchantPhone' => '+4412378',
            'comment' => 'some comment',
            'urlDetails' => SimpleData::getUrlDetails(true),
        ];

        $response = $this->_service->voidTransaction($params);
        $this->assertEquals('SUCCESS', $response['status']);
    }

}
