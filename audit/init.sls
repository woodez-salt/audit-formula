Extra_Device_Entries_Found_Within_/etc/securetty:
  file.managed:
    - name: /etc/securetty
    - contents:
       - console
       - tty1
    - unless: 'grep -qw console /etc/securetty && grep -qw tty1 /etc/securetty && [ $(wc -l /etc/securetty|awk "{print \$1}") == 2 ]'

  {% if grains.osmajorrelease|int == 6 %}
  cmd.run:
    - name: sed -i '/pre-start/d' /etc/init/serial.conf
  {% endif %}
