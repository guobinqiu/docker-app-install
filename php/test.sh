!#/bin/bash
export SM_STATIC_PREFIX=""
export SM_SUFFIX=""
export SM_CLOUD_API_KEY=""
export SM_MYSQL="" #千万不能配置成线上数据库
export SM_REDIS=""
export SM_AMQP=""
export SM_EXERCISE_WAIT=""
/var/www/html/vendor/bin/phpunit -c phpunit.xml --testsuite=models --testsuite=logics
