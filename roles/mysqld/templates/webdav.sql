CREATE TABLE {{ webdav_mysql_table }} (
      {{ webdav_mysql_user_field }} CHAR(30) NOT NULL,
      {{ webdav_mysql_password_field}} CHAR(40) NOT NULL,
      PRIMARY KEY ({{ webdav_mysql_user_field }})
);
{% set users = lookup('file', './users') | from_yaml %}
{% for user in users %}
INSERT INTO `{{ webdav_mysql_table }}` (`{{ webdav_mysql_user_field }}`, `{{ webdav_mysql_password_field}}`) VALUES ('{{ user.username }}', SHA1('{{ user.password }}'));
{% endfor %}
