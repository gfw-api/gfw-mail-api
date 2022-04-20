terraform {
  backend "s3" {
    region         = "us-east-1"
    key            = "mail.tfstate"
    dynamodb_table = "aws-locks"
    encrypt        = true
  }
}

resource "sparkpost_template" "dashboard-complete-en" {
  content_from_email     = "no-reply@globalforestwatch.org"
  content_from_name      = "Global Forest Watch"
  content_subject        = "Dashboard complete for {{ name }}"
  name                   = "Dashboard complete EN"
  options_click_tracking = true
  options_open_tracking  = true
  options_transactional  = true
  published              = true
  content_html           = file("${path.module}/templates/dashboard-complete-en.html")
}

resource "sparkpost_template" "dashboard-pending-fr" {
  content_from_email     = "no-reply@globalforestwatch.org"
  content_from_name      = "Global Forest Watch"
  content_subject        = "Votre tableau de bord est en attente"
  name                   = "Dashboard pending FR"
  options_click_tracking = true
  options_open_tracking  = true
  options_transactional  = true
  published              = true
  content_html           = file("${path.module}/templates/dashboard-pending-fr.html")
}

resource "sparkpost_template" "glad-updated-notification-id" {
  content_from_email     = "no-reply@globalforestwatch.org"
  content_from_name      = "Global Forest Watch"
  content_subject        = "Peringatan perubahan hutan"
  name                   = "GLAD Notifications v2 ID"
  options_click_tracking = true
  options_open_tracking  = true
  options_transactional  = true
  published              = true
  content_html           = file("${path.module}/templates/glad-updated-notification-id.html")
}

resource "sparkpost_template" "dashboard-complete-id" {
  content_from_email     = "no-reply@globalforestwatch.org"
  content_from_name      = "Global Forest Watch"
  content_subject        = "Dasbor lengkap untuk kawasan yang baru Anda buat {{ name }}"
  name                   = "Dashboard complete ID"
  options_click_tracking = true
  options_open_tracking  = true
  options_transactional  = true
  published              = true
  content_html           = file("${path.module}/templates/dashboard-complete-id.html")
}

resource "sparkpost_template" "team-invitation-id" {
  content_from_email     = "no-reply@globalforestwatch.org"
  content_subject        = "You have been invited to join a Forest Watcher team"
  name                   = "Team Invitation ID"
  options_click_tracking = true
  options_open_tracking  = true
  options_transactional  = true
  published              = true
  content_html           = file("${path.module}/templates/team-invitation-id.html")
}

resource "sparkpost_template" "contact-form-confirmation-fr" {
  content_from_email     = "no-reply@globalforestwatch.org"
  content_from_name      = "Global Forest Watch"
  content_subject        = "Merci d'avoir contacté Global Forest Watch"
  name                   = "Contact Form confirmation FR"
  options_click_tracking = true
  options_open_tracking  = true
  options_transactional  = true
  published              = true
  content_html           = file("${path.module}/templates/contact-form-confirmation-fr.html")
}

resource "sparkpost_template" "subscription-preference-change-zh" {
  content_from_email     = "no-reply@globalforestwatch.org"
  content_from_name      = "Global Forest Watch"
  content_subject        = "您的区域订阅偏好已更改 {{ name }}"
  name                   = "Subscription preferences changed ZH"
  options_click_tracking = true
  options_open_tracking  = true
  options_transactional  = true
  published              = true
  content_html           = file("${path.module}/templates/subscription-preference-change-zh.html")
}

resource "sparkpost_template" "forest-change-notification-glads-id" {
  content_from_email     = "no-reply@globalforestwatch.org"
  content_from_name      = "Global Forest Watch"
  content_subject        = "Peringatan perubahan hutan"
  name                   = "Forest Change Notification (GLAD) ID"
  options_click_tracking = true
  options_open_tracking  = true
  options_transactional  = true
  published              = true
  content_html           = file("${path.module}/templates/forest-change-notification-glads-id.html")
}

resource "sparkpost_template" "forest-change-notification-glads-en" {
  content_from_email     = "no-reply@globalforestwatch.org"
  content_from_name      = "Global Forest Watch"
  content_subject        = "Forest change alert"
  name                   = "Forest Change Notification (GLAD) EN"
  options_click_tracking = true
  options_open_tracking  = true
  options_transactional  = true
  published              = true
  content_html           = file("${path.module}/templates/forest-change-notification-glads-en.html")
}

resource "sparkpost_template" "forest-fires-notification-viirs-fr" {
  content_from_email     = "no-reply@globalforestwatch.org"
  content_from_name      = "Global Forest Watch"
  content_subject        = "Alertes incendies"
  name                   = "Forest Fires Notification FR"
  options_click_tracking = true
  options_open_tracking  = true
  options_transactional  = true
  published              = true
  content_html           = file("${path.module}/templates/forest-fires-notification-viirs-fr.html")
}

resource "sparkpost_template" "monthly-summary-es-mx" {
  content_from_email     = "no-reply@globalforestwatch.org"
  content_from_name      = "Global Forest Watch"
  content_subject        = "Resumen mensual de alertas"
  name                   = "Monthly summary ES-MX"
  options_click_tracking = true
  options_open_tracking  = true
  options_transactional  = true
  published              = true
  content_html           = file("${path.module}/templates/monthly-summary-es-mx.html")
}

resource "sparkpost_template" "subscription-confirmation-pt" {
  content_from_email     = "no-reply@globalforestwatch.org"
  content_from_name      = "Global Forest Watch"
  content_subject        = "Confirme sua inscrição no Global Forest Watch"
  name                   = "Subscription confirmation PT"
  options_click_tracking = true
  options_open_tracking  = true
  options_transactional  = true
  published              = true
  content_html           = file("${path.module}/templates/subscription-confirmation-pt.html")
}

resource "sparkpost_template" "team-joined-es" {
  content_from_email     = "no-reply@globalforestwatch.org"
  content_subject        = "Someone has joined your team"
  name                   = "Team Joined ES"
  options_click_tracking = true
  options_open_tracking  = true
  options_transactional  = true
  published              = true
  content_html           = file("${path.module}/templates/team-joined-es.html")
}

resource "sparkpost_template" "dashboard-pending-zh" {
  content_from_email     = "no-reply@globalforestwatch.org"
  content_from_name      = "Global Forest Watch"
  content_subject        = "信息面板整理中"
  name                   = "Dashboard pending ZH"
  options_click_tracking = true
  options_open_tracking  = true
  options_transactional  = true
  published              = true
  content_html           = file("${path.module}/templates/dashboard-pending-zh.html")
}

resource "sparkpost_template" "subscription-confirmation-es-mx" {
  content_from_email     = "no-reply@globalforestwatch.org"
  content_from_name      = "Global Forest Watch"
  content_subject        = "Confirme su suscripción de Global Forest Watch"
  name                   = "Subscription confirmation ES-MX (DO NOT DELETE)"
  options_click_tracking = true
  options_open_tracking  = true
  options_transactional  = true
  published              = true
  content_html           = file("${path.module}/templates/subscription-confirmation-es-mx.html")
}

resource "sparkpost_template" "contact-form-confirmation-pt" {
  content_from_email     = "no-reply@globalforestwatch.org"
  content_from_name      = "Global Forest Watch"
  content_subject        = "Obrigado por entrar em contato com a Global Forest Watch"
  name                   = "Contact Form confirmation PT"
  options_click_tracking = true
  options_open_tracking  = true
  options_transactional  = true
  published              = true
  content_html           = file("${path.module}/templates/contact-form-confirmation-pt.html")
}

resource "sparkpost_template" "glad-updated-notification-en" {
  content_from_email     = "no-reply@globalforestwatch.org"
  content_from_name      = "Global Forest Watch"
  content_subject        = "Forest change alert"
  name                   = "GLAD Notifications v2 EN"
  options_click_tracking = true
  options_open_tracking  = true
  options_transactional  = true
  published              = true
  content_html           = file("${path.module}/templates/glad-updated-notification-en.html")
}

resource "sparkpost_template" "monthly-summary-pt-br" {
  content_from_email     = "no-reply@globalforestwatch.org"
  content_from_name      = "Global Forest Watch"
  content_subject        = "Resumo mensal de alertas"
  name                   = "Monthly summary PT-BR"
  options_click_tracking = true
  options_open_tracking  = true
  options_transactional  = true
  published              = true
  content_html           = file("${path.module}/templates/monthly-summary-pt-br.html")
}

resource "sparkpost_template" "dataset" {
  content_from_email     = "no-reply@globalforestwatch.org"
  content_subject        = "Dataset Alerts"
  name                   = "Dataset alert (Resource Watch)"
  options_click_tracking = true
  options_open_tracking  = true
  options_transactional  = false
  published              = true
  content_html           = file("${path.module}/templates/dataset.html")
}

resource "sparkpost_template" "dashboard-complete-es_MX" {
  content_from_email     = "no-reply@globalforestwatch.org"
  content_from_name      = "Global Forest Watch"
  content_subject        = "El tablero del área creada recientemente está completo {{ name }}"
  name                   = "Dashboard complete ES-MX"
  options_click_tracking = true
  options_open_tracking  = true
  options_transactional  = true
  published              = true
  content_html           = file("${path.module}/templates/dashboard-complete-es_MX.html")
}

resource "sparkpost_template" "team-joined-id" {
  content_from_email     = "no-reply@globalforestwatch.org"
  content_subject        = "Someone has joined your team"
  name                   = "Team Joined ID"
  options_click_tracking = true
  options_open_tracking  = true
  options_transactional  = true
  published              = true
  content_html           = file("${path.module}/templates/team-joined-id.html")
}

resource "sparkpost_template" "subscription-confirmation-fr" {
  content_from_email     = "no-reply@globalforestwatch.org"
  content_from_name      = "Global Forest Watch"
  content_subject        = "Confirmer votre abonnement Global Forest Watch"
  name                   = "Subscription confirmation FR"
  options_click_tracking = true
  options_open_tracking  = true
  options_transactional  = true
  published              = true
  content_html           = file("${path.module}/templates/subscription-confirmation-fr.html")
}

resource "sparkpost_template" "team-joined-en" {
  content_from_email     = "no-reply@globalforestwatch.org"
  content_subject        = "Someone has joined your team"
  name                   = "Team Joined EN"
  options_click_tracking = true
  options_open_tracking  = true
  options_transactional  = true
  published              = true
  content_html           = file("${path.module}/templates/team-joined-en.html")
}

resource "sparkpost_template" "rw-dataset" {
  content_from_email     = "no-reply@resourcewatch.org"
  content_subject        = "Alerts"
  name                   = "Dataset alert (Resource Watch)"
  options_click_tracking = true
  options_open_tracking  = true
  options_transactional  = false
  published              = true
  content_html           = file("${path.module}/templates/rw-dataset.html")
}

resource "sparkpost_template" "contact-form" {
  content_from_email     = "no-reply@globalforestwatch.org"
  content_from_name      = "Global Forest Watch"
  content_subject        = "{{subject}}"
  name                   = "Contact form submission EN (Internal)"
  options_click_tracking = true
  options_open_tracking  = true
  options_transactional  = true
  published              = true
  content_html           = file("${path.module}/templates/contact-form.html")
}

resource "sparkpost_template" "contact-form-confirmation-zh" {
  content_from_email     = "no-reply@globalforestwatch.org"
  content_from_name      = "Global Forest Watch"
  content_subject        = "感谢您联系全球森林监察"
  name                   = "Contact Form confirmation ZH"
  options_click_tracking = true
  options_open_tracking  = true
  options_transactional  = true
  published              = true
  content_html           = file("${path.module}/templates/contact-form-confirmation-zh.html")
}

resource "sparkpost_template" "team-invitation-es" {
  content_from_email     = "no-reply@globalforestwatch.org"
  content_subject        = "You have been invited to join a Forest Watcher team"
  name                   = "Team Invitation ES"
  options_click_tracking = true
  options_open_tracking  = true
  options_transactional  = true
  published              = true
  content_html           = file("${path.module}/templates/team-invitation-es.html")
}

resource "sparkpost_template" "forest-fires-notification-viirs-en-updated" {
  content_from_email     = "no-reply@globalforestwatch.org"
  content_from_name      = "Global Forest Watch"
  content_subject        = "Fire Alerts"
  name                   = "Forest Fires Notification EN (UPDATED)"
  options_click_tracking = true
  options_open_tracking  = true
  options_transactional  = true
  published              = true
  content_html           = file("${path.module}/templates/forest-fires-notification-viirs-en-updated.html")
}

resource "sparkpost_template" "dashboard-pending-pt_BR" {
  content_from_email     = "no-reply@globalforestwatch.org"
  content_from_name      = "Global Forest Watch"
  content_subject        = "Painel sendo criado"
  name                   = "Dashboard pending PT-BR"
  options_click_tracking = true
  options_open_tracking  = true
  options_transactional  = true
  published              = true
  content_html           = file("${path.module}/templates/dashboard-pending-pt_BR.html")
}

resource "sparkpost_template" "monthly-summary-fr" {
  content_from_email     = "no-reply@globalforestwatch.org"
  content_from_name      = "Global Forest Watch"
  content_subject        = "Résumé mensuel des alertes"
  name                   = "Monthly summary FR"
  options_click_tracking = true
  options_open_tracking  = true
  options_transactional  = true
  published              = true
  content_html           = file("${path.module}/templates/monthly-summary-fr.html")
}

resource "sparkpost_template" "subscription-confirmation-zh" {
  content_from_email     = "no-reply@globalforestwatch.org"
  content_from_name      = "Global Forest Watch"
  content_subject        = "请确认您的Global Forest Watch订阅"
  name                   = "Subscription confirmation ZH"
  options_click_tracking = true
  options_open_tracking  = true
  options_transactional  = true
  published              = true
  content_html           = file("${path.module}/templates/subscription-confirmation-zh.html")
}

resource "sparkpost_template" "subscription-confirmation-id" {
  content_from_email     = "no-reply@globalforestwatch.org"
  content_from_name      = "Global Forest Watch"
  content_subject        = "Silakan konfirmasi langganan Global Forest Watch Anda"
  name                   = "Subscription confirmation ID"
  options_click_tracking = true
  options_open_tracking  = true
  options_transactional  = true
  published              = true
  content_html           = file("${path.module}/templates/subscription-confirmation-id.html")
}

resource "sparkpost_template" "forest-change-notification-glads-es-mx" {
  content_from_email     = "no-reply@globalforestwatch.org"
  content_from_name      = "Global Forest Watch"
  content_subject        = "Alertas de deforestación "
  name                   = "Forest Change Notification (GLAD) ES-MX"
  options_click_tracking = true
  options_open_tracking  = true
  options_transactional  = true
  published              = true
  content_html           = file("${path.module}/templates/forest-change-notification-glads-es-mx.html")
}

resource "sparkpost_template" "monthly-summary-zh" {
  content_from_email     = "no-reply@globalforestwatch.org"
  content_from_name      = "Global Forest Watch"
  content_subject        = "每月警报摘要"
  name                   = "Monthly summary ZH"
  options_click_tracking = true
  options_open_tracking  = true
  options_transactional  = true
  published              = true
  content_html           = file("${path.module}/templates/monthly-summary-zh.html")
}

resource "sparkpost_template" "contact-form-confirmation-es" {
  content_from_email     = "no-reply@globalforestwatch.org"
  content_subject        = "Gracias por mandar un mensaje a Global Forest Watch"
  name                   = "Contact Form confirmation ES"
  options_click_tracking = true
  options_open_tracking  = true
  options_transactional  = true
  published              = true
  content_html           = file("${path.module}/templates/contact-form-confirmation-es.html")
}

resource "sparkpost_template" "glad-updated-notification-pt-br" {
  content_from_email     = "no-reply@globalforestwatch.org"
  content_from_name      = "Global Forest Watch"
  content_subject        = "Alertas de desmatamento"
  name                   = "GLAD Notifications v2 PT-BR"
  options_click_tracking = true
  options_open_tracking  = true
  options_transactional  = true
  published              = true
  content_html           = file("${path.module}/templates/glad-updated-notification-pt-br.html")
}

resource "sparkpost_template" "subscription-preference-change-en" {
  content_from_email     = "no-reply@globalforestwatch.org"
  content_from_name      = "Global Forest Watch"
  content_subject        = "Subscription preferences changed for {{ name }}"
  name                   = "Subscription preferences changed EN"
  options_click_tracking = true
  options_open_tracking  = true
  options_transactional  = true
  published              = true
  content_html           = file("${path.module}/templates/subscription-preference-change-en.html")
}

resource "sparkpost_template" "monthly-summary-en" {
  content_from_email     = "no-reply@globalforestwatch.org"
  content_from_name      = "Global Forest Watch"
  content_subject        = "Monthly Summary of Alerts"
  name                   = "Monthly summary EN"
  options_click_tracking = true
  options_open_tracking  = true
  options_transactional  = true
  published              = true
  content_html           = file("${path.module}/templates/monthly-summary-en.html")
}

resource "sparkpost_template" "monthly-summary-id" {
  content_from_email     = "no-reply@globalforestwatch.org"
  content_from_name      = "Global Forest Watch"
  content_subject        = "Ringkasan peringatan bulanan"
  name                   = "Monthly summary ID"
  options_click_tracking = true
  options_open_tracking  = true
  options_transactional  = true
  published              = true
  content_html           = file("${path.module}/templates/monthly-summary-id.html")
}

resource "sparkpost_template" "forest-fires-notification-viirs-es-mx" {
  content_from_email     = "no-reply@globalforestwatch.org"
  content_from_name      = "Global Forest Watch"
  content_subject        = "Alertas de incendio"
  name                   = "Forest Fires Notification ES-MX"
  options_click_tracking = true
  options_open_tracking  = true
  options_transactional  = true
  published              = true
  content_html           = file("${path.module}/templates/forest-fires-notification-viirs-es-mx.html")
}

resource "sparkpost_template" "forest-fires-notification-viirs-id" {
  content_from_email     = "no-reply@globalforestwatch.org"
  content_from_name      = "Global Forest Watch"
  content_subject        = "Peringatan kebakaran"
  name                   = "Forest Fires Notification ID"
  options_click_tracking = true
  options_open_tracking  = true
  options_transactional  = true
  published              = true
  content_html           = file("${path.module}/templates/forest-fires-notification-viirs-id.html")
}

resource "sparkpost_template" "subscription-confirmation-en" {
  content_from_email     = "no-reply@globalforestwatch.org"
  content_from_name      = "Global Forest Watch"
  content_subject        = "Confirm your Global Forest Watch subscription"
  name                   = "Subscription confirmation EN"
  options_click_tracking = true
  options_open_tracking  = true
  options_transactional  = true
  published              = true
  content_html           = file("${path.module}/templates/subscription-confirmation-en.html")
}

resource "sparkpost_template" "recover-password" {
  content_from_email     = "{{fromEmail}}"
  content_from_name      = "{{fromName}}"
  content_subject        = "Recover password"
  name                   = "Recover password"
  options_click_tracking = true
  options_open_tracking  = true
  options_transactional  = false
  published              = true
  content_html           = file("${path.module}/templates/recover-password.html")
}

resource "sparkpost_template" "forest-change-notification-glads-fr" {
  content_from_email     = "no-reply@globalforestwatch.org"
  content_from_name      = "Global Forest Watch"
  content_subject        = "Alerte d'évolution forestière"
  name                   = "Forest Change Notification (GLAD) FR"
  options_click_tracking = true
  options_open_tracking  = true
  options_transactional  = true
  published              = true
  content_html           = file("${path.module}/templates/forest-change-notification-glads-fr.html")
}

resource "sparkpost_template" "glad-updated-notification-zh" {
  content_from_email     = "no-reply@globalforestwatch.org"
  content_from_name      = "Global Forest Watch"
  content_subject        = "森林变化预警"
  name                   = "GLAD Notifications v2 ZH"
  options_click_tracking = true
  options_open_tracking  = true
  options_transactional  = true
  published              = true
  content_html           = file("${path.module}/templates/glad-updated-notification-zh.html")
}

resource "sparkpost_template" "team-joined-fr" {
  content_from_email     = "no-reply@globalforestwatch.org"
  content_subject        = "Someone has joined your team"
  name                   = "Team Joined FR"
  options_click_tracking = true
  options_open_tracking  = true
  options_transactional  = true
  published              = true
  content_html           = file("${path.module}/templates/team-joined-fr.html")
}

resource "sparkpost_template" "confirm-user" {
  content_from_email     = "{{fromEmail}}"
  content_from_name      = "{{fromName}}"
  content_subject        = "Confirm user"
  name                   = "Confirm user"
  options_click_tracking = true
  options_open_tracking  = true
  options_transactional  = false
  published              = true
  content_html           = file("${path.module}/templates/confirm-user.html")
}

resource "sparkpost_template" "glad-updated-notification-fr" {
  content_from_email     = "no-reply@globalforestwatch.org"
  content_from_name      = "Global Forest Watch"
  content_subject        = "Alerte d'évolution forestière"
  name                   = "GLAD Notifications v2 FR"
  options_click_tracking = true
  options_open_tracking  = true
  options_transactional  = true
  published              = true
  content_html           = file("${path.module}/templates/glad-updated-notification-fr.html")
}

resource "sparkpost_template" "subscription-confirmation-rw-en" {
  content_from_email     = "no-reply@resourcewatch.org"
  content_from_name      = "Resource Watch"
  content_subject        = "Confirm your Subscription"
  name                   = "Subscription confirmation EN (Resource Watch)"
  options_click_tracking = true
  options_open_tracking  = true
  options_transactional  = false
  published              = true
  content_html           = file("${path.module}/templates/subscription-confirmation-rw-en.html")
  description            = "Confirm your Subscription"
}

resource "sparkpost_template" "subscription-preference-change-es_MX" {
  content_from_email     = "no-reply@globalforestwatch.org"
  content_from_name      = "Global Forest Watch"
  content_subject        = "Se modificaron las preferencias de suscripción para su área {{ name }}"
  name                   = "Subscription preferences changed ES-MX"
  options_click_tracking = true
  options_open_tracking  = true
  options_transactional  = true
  published              = true
  content_html           = file("${path.module}/templates/subscription-preference-change-es_MX.html")
}

resource "sparkpost_template" "dashboard-pending-en" {
  content_from_email     = "no-reply@globalforestwatch.org"
  content_from_name      = "Global Forest Watch"
  content_subject        = "Dashboard pending for {{ name }}"
  name                   = "Dashboard pending EN"
  options_click_tracking = true
  options_open_tracking  = true
  options_transactional  = true
  published              = true
  content_html           = file("${path.module}/templates/dashboard-pending-en.html")
}

resource "sparkpost_template" "confirm-user-with-password" {
  content_from_email     = "{{fromEmail}}"
  content_from_name      = "{{fromName}}"
  content_subject        = "Confirm user"
  name                   = "Confirm user with password"
  options_click_tracking = true
  options_open_tracking  = true
  options_transactional  = false
  published              = true
  content_html           = file("${path.module}/templates/confirm-user-with-password.html")
}

resource "sparkpost_template" "glad-updated-notification-es-mx" {
  content_from_email     = "no-reply@globalforestwatch.org"
  content_from_name      = "Global Forest Watch"
  content_subject        = "Alertas de deforestación"
  name                   = "GLAD Notifications v2 ES-MX"
  options_click_tracking = true
  options_open_tracking  = true
  options_transactional  = true
  published              = true
  content_html           = file("${path.module}/templates/glad-updated-notification-es-mx.html")
}

resource "sparkpost_template" "subscription-confirmation-pt-br" {
  content_from_email     = "no-reply@globalforestwatch.org"
  content_from_name      = "Global Forest Watch"
  content_subject        = "Confirme sua inscrição no Global Forest Watch"
  name                   = "Subscription confirmation PT-BR (DO NOT DELETE)"
  options_click_tracking = true
  options_open_tracking  = true
  options_transactional  = true
  published              = true
  content_html           = file("${path.module}/templates/subscription-confirmation-pt-br.html")
}

resource "sparkpost_template" "dataset-rw-staging" {
  content_from_email     = "no-reply@resourcewatch.org"
  content_subject        = "{{subject}}-staging"
  name                   = "Dataset alert (Resource Watch) Staging"
  options_click_tracking = true
  options_open_tracking  = true
  options_transactional  = false
  published              = true
  content_html           = file("${path.module}/templates/dataset-rw-staging.html")
}

resource "sparkpost_template" "forest-change-notification-glads-pt-br" {
  content_from_email     = "no-reply@globalforestwatch.org"
  content_from_name      = "Global Forest Watch"
  content_subject        = "Alertas de desmatamento"
  name                   = "Forest Change Notification (GLAD) PT-BR"
  options_click_tracking = true
  options_open_tracking  = true
  options_transactional  = true
  published              = true
  content_html           = file("${path.module}/templates/forest-change-notification-glads-pt-br.html")
}

resource "sparkpost_template" "subscription-preference-change-pt_BR" {
  content_from_email     = "no-reply@globalforestwatch.org"
  content_from_name      = "Global Forest Watch"
  content_subject        = "Preferências de assinatura alteradas para sua área {{ name }}"
  name                   = "Subscription preferences changed PT-BR"
  options_click_tracking = true
  options_open_tracking  = true
  options_transactional  = true
  published              = true
  content_html           = file("${path.module}/templates/subscription-preference-change-pt_BR.html")
}

resource "sparkpost_template" "contact-form-confirmation-id" {
  content_from_email     = "no-reply@globalforestwatch.org"
  content_from_name      = "Global Forest Watch"
  content_subject        = "Terima kasih telah menghubungi Global Forest Watch"
  name                   = "Contact Form confirmation ID"
  options_click_tracking = true
  options_open_tracking  = true
  options_transactional  = true
  published              = true
  content_html           = file("${path.module}/templates/contact-form-confirmation-id.html")
}

resource "sparkpost_template" "dashboard-complete-fr" {
  content_from_email     = "no-reply@globalforestwatch.org"
  content_from_name      = "Global Forest Watch"
  content_subject        = "Tableau de bord terminé pour la zone que vous avez récemment créée {{ name }}"
  name                   = "Dashboard complete FR"
  options_click_tracking = true
  options_open_tracking  = true
  options_transactional  = true
  published              = true
  content_html           = file("${path.module}/templates/dashboard-complete-fr.html")
}

resource "sparkpost_template" "subscription-confirmation-es" {
  content_from_email     = "no-reply@globalforestwatch.org"
  content_from_name      = "Global Forest Watch"
  content_subject        = "Confirme su suscripción de Global Forest Watch"
  name                   = "Subscription confirmation ES"
  options_click_tracking = true
  options_open_tracking  = true
  options_transactional  = true
  published              = true
  content_html           = file("${path.module}/templates/subscription-confirmation-es.html")
}

resource "sparkpost_template" "dataset-rw" {
  content_from_email     = "no-reply@resourcewatch.org"
  content_subject        = "{{subject}}"
  name                   = "Dataset alert (Resource Watch)"
  options_click_tracking = true
  options_open_tracking  = true
  options_transactional  = false
  published              = true
  content_html           = file("${path.module}/templates/dataset-rw.html")
}

resource "sparkpost_template" "team-joined-pt" {
  content_from_email     = "no-reply@globalforestwatch.org"
  content_subject        = "Someone has joined your team"
  name                   = "Team Joined PT"
  options_click_tracking = true
  options_open_tracking  = true
  options_transactional  = true
  published              = true
  content_html           = file("${path.module}/templates/team-joined-pt.html")
}

resource "sparkpost_template" "forest-change-notification-glads-en-updated" {
  content_from_email     = "no-reply@globalforestwatch.org"
  content_from_name      = "Global Forest Watch"
  content_subject        = "Forest change alert"
  name                   = "Forest Change Notification (GLAD) EN (UPDATED)"
  options_click_tracking = true
  options_open_tracking  = true
  options_transactional  = true
  published              = true
  content_html           = file("${path.module}/templates/forest-change-notification-glads-en-updated.html")
}

resource "sparkpost_template" "team-invitation-en" {
  content_from_email     = "no-reply@globalforestwatch.org"
  content_subject        = "You have been invited to join a Forest Watcher team"
  name                   = "Team Invitation EN"
  options_click_tracking = true
  options_open_tracking  = true
  options_transactional  = true
  published              = true
  content_html           = file("${path.module}/templates/team-invitation-en.html")
}

resource "sparkpost_template" "forest-fires-notification-viirs-pt-br" {
  content_from_email     = "no-reply@globalforestwatch.org"
  content_from_name      = "Global Forest Watch"
  content_subject        = "Alertas de incêndio"
  name                   = "Forest Fires Notification PT-BR"
  options_click_tracking = true
  options_open_tracking  = true
  options_transactional  = true
  published              = true
  content_html           = file("${path.module}/templates/forest-fires-notification-viirs-pt-br.html")
}

resource "sparkpost_template" "forest-fires-notification-viirs-en" {
  content_from_email     = "no-reply@globalforestwatch.org"
  content_from_name      = "Global Forest Watch"
  content_subject        = "Fire Alerts"
  name                   = "Forest Fires Notification EN"
  options_click_tracking = true
  options_open_tracking  = true
  options_transactional  = true
  published              = true
  content_html           = file("${path.module}/templates/forest-fires-notification-viirs-en.html")
}

resource "sparkpost_template" "forest-change-notification-glads-zh" {
  content_from_email     = "no-reply@globalforestwatch.org"
  content_from_name      = "Global Forest Watch"
  content_subject        = "森林变化预警"
  name                   = "Forest Change Notification (GLAD) ZH"
  options_click_tracking = true
  options_open_tracking  = true
  options_transactional  = true
  published              = true
  content_html           = file("${path.module}/templates/forest-change-notification-glads-zh.html")
}

resource "sparkpost_template" "subscription-preference-change-id" {
  content_from_email     = "no-reply@globalforestwatch.org"
  content_from_name      = "Global Forest Watch"
  content_subject        = "Preferensi berlangganan berubah untuk kawasan Anda {{ name }}"
  name                   = "Subscription preferences changed ID"
  options_click_tracking = true
  options_open_tracking  = true
  options_transactional  = true
  published              = true
  content_html           = file("${path.module}/templates/subscription-preference-change-id.html")
}

resource "sparkpost_template" "contact-form-confirmation-en" {
  content_from_email     = "no-reply@globalforestwatch.org"
  content_subject        = "Thank you for contacting Global Forest Watch."
  name                   = "Contact Form confirmation EN"
  options_click_tracking = true
  options_open_tracking  = true
  options_transactional  = true
  published              = true
  content_html           = file("${path.module}/templates/contact-form-confirmation-en.html")
}

resource "sparkpost_template" "forest-fires-notification-viirs-zh" {
  content_from_email     = "no-reply@globalforestwatch.org"
  content_from_name      = "Global Forest Watch"
  content_subject        = "火灾警报"
  name                   = "Forest Fires Notification ZH"
  options_click_tracking = true
  options_open_tracking  = true
  options_transactional  = true
  published              = true
  content_html           = file("${path.module}/templates/forest-fires-notification-viirs-zh.html")
}

resource "sparkpost_template" "dashboard-complete-zh" {
  content_from_email     = "no-reply@globalforestwatch.org"
  content_from_name      = "Global Forest Watch"
  content_subject        = "您最近创建的区域已完成信息面板 {{ name }}"
  name                   = "Dashboard complete ZH"
  options_click_tracking = true
  options_open_tracking  = true
  options_transactional  = true
  published              = true
  content_html           = file("${path.module}/templates/dashboard-complete-zh.html")
}

resource "sparkpost_template" "subscription-preference-change-fr" {
  content_from_email     = "no-reply@globalforestwatch.org"
  content_from_name      = "Global Forest Watch"
  content_subject        = "Préférences d’abonnement modifiées pour votre zone {{ name }}"
  name                   = "Subscription preferences changed FR"
  options_click_tracking = true
  options_open_tracking  = true
  options_transactional  = true
  published              = true
  content_html           = file("${path.module}/templates/subscription-preference-change-fr.html")
}

resource "sparkpost_template" "dashboard-pending-es_MX" {
  content_from_email     = "no-reply@globalforestwatch.org"
  content_from_name      = "Global Forest Watch"
  content_subject        = "Actualización de panel en proceso"
  name                   = "Dashboard pending ES-MX"
  options_click_tracking = true
  options_open_tracking  = true
  options_transactional  = true
  published              = true
  content_html           = file("${path.module}/templates/dashboard-pending-es_MX.html")
}

resource "sparkpost_template" "dashboard-complete-pt_BR" {
  content_from_email     = "no-reply@globalforestwatch.org"
  content_from_name      = "Global Forest Watch"
  content_subject        = "Painel concluído para a área recém-criada {{ name }}"
  name                   = "Dashboard complete PT-BR"
  options_click_tracking = true
  options_open_tracking  = true
  options_transactional  = true
  published              = true
  content_html           = file("${path.module}/templates/dashboard-complete-pt_BR.html")
}

resource "sparkpost_template" "dashboard-pending-id" {
  content_from_email     = "no-reply@globalforestwatch.org"
  content_from_name      = "Global Forest Watch"
  content_subject        = "Dasbor tertunda"
  name                   = "Dashboard pending ID"
  options_click_tracking = true
  options_open_tracking  = true
  options_transactional  = true
  published              = true
  content_html           = file("${path.module}/templates/dashboard-pending-id.html")
}

resource "sparkpost_template" "team-invitation-pt" {
  content_from_email     = "no-reply@globalforestwatch.org"
  content_subject        = "You have been invited to join a Forest Watcher team"
  name                   = "Team Invitation PT"
  options_click_tracking = true
  options_open_tracking  = true
  options_transactional  = true
  published              = true
  content_html           = file("${path.module}/templates/team-invitation-pt.html")
}

resource "sparkpost_template" "team-invitation-fr" {
  content_from_email     = "no-reply@globalforestwatch.org"
  content_subject        = "You have been invited to join a Forest Watcher team"
  name                   = "Team Invitation FR"
  options_click_tracking = true
  options_open_tracking  = true
  options_transactional  = true
  published              = true
  content_html           = file("${path.module}/templates/team-invitation-fr.html")
}
