restart_journald:
  module.wait:
    - name: service.restart
    - m_name: systemd-journald

/etc/systemd/journald.conf:
  file.managed:
    - source: salt://systemd-journald/config/journald.conf
    - watch_in:
      - module: restart_journald
