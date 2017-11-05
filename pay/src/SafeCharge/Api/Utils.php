<?php

namespace SafeCharge\Api;


class Utils
{
    /**
     * @param $params array - parameters
     * @param $checksumParamsOrder array - array with parameter order for checksum calculation
     * @param $merchantSecretId - Merchant Site ID
     * @param string $algo - algorithm (sha256, md5)
     * @return string - checksum
     */
    public static function calculateChecksum(array $params, array $checksumParamsOrder, $merchantSecretId, $algo = 'sha256')
    {
        $checksumParams = [];
        foreach ($checksumParamsOrder as $value) {
            if (isset($params[$value])) {
                $checksumParams[$value] = $params[$value];
            }
        }
        $concatenatedString = self::arrayToString($checksumParams);
        print_R($concatenatedString . $merchantSecretId);
        echo '<br/>';
        print_r(hash($algo, $concatenatedString . $merchantSecretId));
        echo '<br/>';
        return hash($algo, $concatenatedString . $merchantSecretId);
    }

    /**
     * @param $array
     * @return string
     */
    public static function arrayToString($array)
    {
        $string = '';
        foreach ($array as $element) {
            if (!is_array($element)) {
                $string .= $element;
            } else {
                $string .= self::arrayToString($element);
            }
        }
        return $string;
    }

}