<?php


namespace SafeCharge\Tests;


class SimpleData
{

    public static function getAmountDetails()
    {
        return [
            "totalShipping" => "0",
            "totalHandling" => "0",
            "totalDiscount" => "0",
            "totalTax" => "0"
        ];
    }

    public static function getItems()
    {
        return [
            [
                "id" => "1",
                "name" => "name",
                "price" => "10",
                "quantity" => "1"
            ]
        ];
    }

    public static function getDeviceDetails()
    {
        return [
            "deviceType" => "MOBILE",
            "deviceName" => "deviceName",
            "deviceOS" => "deviceOS",
            "browser" => "browser",
            "ipAddress" => "192.168.1.54"
        ];
    }

    public static function getUserDetails()
    {
        return [
            "firstName" => "some first name",
            "lastName" => "some last name",
            "phone" => "972502457558",
            "email" => "someemail@somedomain.com",
            "address" => "some street",
            "city" => "some city",
            "zip" => "123456",
            "country" => "US",
            "state" => "AK"
        ];
    }

    public static function getShippingAddress()
    {
        return [
            "firstName" => "some first name",
            "lastName" => "some last name",
            "cell" => "",
            "phone" => "972502457558",
            "email" => "someemail@somedomain.com",
            "address" => "some street",
            "city" => "some city",
            "zip" => "123456",
            "country" => "US",
            "state" => "AK"
        ];
    }

    public static function getBillingAddress($addCountryCode = false)
    {
        $countryParameter = $addCountryCode ? 'countryCode' : 'country';
        return [
            "firstName" => "some first name",
            "lastName" => "some last name",
            "address" => "some street",
            "phone" => "972502457558",
            "zip" => "123456",
            "city" => "some city",
            $countryParameter => "US",
            "state" => "AK",
            "email" => "someemail@somedomain.com",
        ];
    }

    public static function getMerchantDetails()
    {
        return [
            "customInfoField1" => "",
            "customInfoField2" => "",
            "customInfoField3" => "",
            "customInfoField4" => "",
            "customInfoField5" => "",
            "customInfoField6" => "",
            "customInfoField7" => "",
            "customInfoField8" => "",
            "customInfoField9" => "",
            "customInfoField10" => ""
        ];
    }

    public static function getDynamicDescriptor()
    {
        return [
            "merchantName" => "merchantName",
            "merchantPhone" => "merchantPhone"
        ];
    }

    public static function getCarData($ccTempToken = false)
    {
        if ($ccTempToken == false) {
            return [
                'cardNumber' => '4012001037141112',
                'cardHolderName' => 'some name',
                'expirationMonth' => '01',
                'expirationYear' => '2020',
                'CVV' => '122',
            ];
        }

        return [
            'ccTempToken' => $ccTempToken,
            'CVV' => '122'
        ];
    }

    public static function getUserPaymentOption()
    {
        return
            [
                'userPaymentOptionId' => '1459503',
                'CVV' => '234'
            ];
    }

    public static function getUrlDetails($onlyNotificationUrl = true)
    {
        if ($onlyNotificationUrl) {
            return [
                'notificationUrl' => 'https://www.safecharge.com',
            ];
        }
        return [
            'successUrl' => 'https://www.safecharge.com',
            'failureUrl' => 'https://www.safecharge.com',
            'pendingUrl' => 'https://www.safecharge.com',
            'notificationUrl' => 'https://www.safecharge.com',
        ];
    }

    public static function getUserAccountDetails()
    {
        return [
            'email' => 'user@mail.com'
        ];
    }

    public static function getAddEndUms()
    {
        return [
            'localPayment' => [
                'nationalId' => '012345678',
                'debitType' => 'RegularCredit',
                'firstInstallment' => '1',
                'periodicalInstallment' => '1',
                'numberOfInstallments' => '2'
            ]
        ];
    }

}