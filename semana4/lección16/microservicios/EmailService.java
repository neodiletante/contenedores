import java.io.File;
import javax.mail.*;
import javax.mail.internet.*;
import java.util.Properties;

public class EmailService {

    // Definir el correo "from" como una constante
    private static final String FROM_EMAIL = "tucorreo@example.com";

    public static void main(String[] args) {
        if (args.length < 2) {
            System.out.println("Utilización: java EmailService <smtp_server> <email_destinatario>");
            System.exit(1);
        }

        String smtpServer = args[0];
        String toEmail = args[1];

        while (true) { // Bucle infinito para la comprobación periódica
            checkFilesAndSendEmails(smtpServer, toEmail);
            try {
                Thread.sleep(30000); // Pausa de 30 segundos entre comprobaciones
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }

    public static void checkFilesAndSendEmails(String smtpServer, String toEmail) {
        File folder = new File("/uploads");
        File[] listOfFiles = folder.listFiles();

        if (listOfFiles != null) {
            for (File file : listOfFiles) {
                if (file.isFile() && file.length() > 100 * 1024) {
                    sendEmail(smtpServer, toEmail, "Alerta", "El fichero " + file.getName() + " tiene mas de 100KB");
                }
            }
        }
    }

    public static void sendEmail(String smtpServer, String to, String subject, String body) {
        Properties properties = System.getProperties();
        properties.setProperty("mail.smtp.host", smtpServer);

        Session session = Session.getDefaultInstance(properties);

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(FROM_EMAIL));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject(subject);
            message.setText(body);

            Transport.send(message);
            System.out.println("Email enviado con éxito");
        } catch (MessagingException mex) {
            mex.printStackTrace();
        }
    }
}
