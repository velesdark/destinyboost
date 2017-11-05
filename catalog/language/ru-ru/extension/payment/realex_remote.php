<?php
// Text
$_['text_title'] = 'Кредитная или дебетовая карта';
$_['text_credit_card'] = 'Данные кредитной карты';
$_['text_wait'] = 'Пожалуйста, подождите!';
$_['text_result'] = 'Результат';
$_['text_message'] = 'Сообщение';
$_['text_cvn_result'] = 'CVN-результат';
$_['text_avs_postcode'] = 'Почтовый индекс AVS';
$_['text_avs_address'] = 'AVS адрес';
$_['text_eci'] = 'Результат ECI (3D secure)';
$_['text_tss'] = 'TSS результат';
$_['text_card_bank'] = 'Банк выдавший карту';
$_['text_card_country'] = 'Страна карты';
$_['text_card_region'] = 'Регион карты';
$_['text_last_digits'] = 'Последние 4 цифры';
$_['text_order_ref'] = 'Ссылка на заказ';
$_['text_timestamp'] = 'Штамп времени';
$_['text_card_visa'] = 'Visa';
$_['text_card_mc'] = 'MasterCard';
$_['text_card_amex'] = 'American Express';
$_['text_card_switch'] = 'Switch';
$_['text_card_laser'] = 'Laser';
$_['text_card_diners'] = 'Diners';
$_['text_auth_code'] = 'Код авторизации';
$_['text_3d_s1'] = 'Владелец карты не записан, сдвиг ответственности';
$_['text_3d_s2'] = 'Невозможно проверить посещаемость, нет сдвига ответственности';
$_['text_3d_s3'] = 'Некорректный ответ от сервера посещаемости, нет сдвига ответственности';
$_['text_3d_s4'] = 'Записано, но неверный ответ от СКД (сервера контроля доступа), нет сдвига ответственности';
$_['text_3d_s5'] = 'Успешная аутентификация, сдвиг ответственности';
$_['text_3d_s6'] = 'Попытка проверки подлинности признана, сдвиг ответственности';
$_['text_3d_s7'] = 'Неверно введен пароль, нет сдвига ответственности';
$_['text_3d_s8'] = 'Проверка подлинности недоступна, нет сдвига ответственности';
$_['text_3d_s9'] = 'Недопустимый ответ от СКД, нет сдвига ответственности';
$_['text_3d_s10'] = 'Неустранимая ошибка RealMPI, нет сдвига ответственности';

// Entry
$_['entry_cc_type'] = 'Тип карты';
$_['entry_cc_number'] = 'Номер карты';
$_['entry_cc_name'] = 'Имя владельца карты';
$_['entry_cc_expire_date'] = 'Срок действия карты';
$_['entry_cc_cvv2'] = 'Код безопасности карты (CVV2)';
$_['entry_cc_issue'] = 'Номер карты';

// Help
$_['help_start_date'] = '(если имеется)';
$_['help_issue'] = '(только для карт Maestro и Solo)';

// Error
$_['error_card_number'] = 'Пожалуйста, проверьте правильность номера вашей карты';
$_['error_card_name'] = 'Пожалуйста, проверьте правильность имени владельца карты';
$_['error_card_cvv'] = 'Пожалуйста, проверьте правильность CVV2-кода';
$_['error_3d_unable'] = 'Продавец требует 3D secure, но не может сверить с вашим банком, пожалуйста, попробуйте позже';
$_['error_3d_500_response_no_payment'] = 'Недопустимый ответ был получен от обработчика карты, оплата не была принята';
$_['error_3d_unsuccessful'] = '3D secure авторизация не удалась';