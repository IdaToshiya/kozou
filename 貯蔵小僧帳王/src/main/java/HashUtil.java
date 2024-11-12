import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class HashUtil {
    // パスワードをハッシュ化するメソッド
    public static String hashPassword(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256"); // SHA-256アルゴリズムを使用
            byte[] hashedBytes = md.digest(password.getBytes()); // バイト配列に変換
            StringBuilder sb = new StringBuilder();
            for (byte b : hashedBytes) {
                sb.append(String.format("%02x", b)); // 16進数に変換
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e); // アルゴリズムが見つからない場合の例外処理
        }
    }
}

