/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package rsatest;

import java.io.IOException;
import java.math.BigInteger;
import java.security.PrivateKey;
import javax.crypto.Cipher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

public class LoginServlet extends HttpServlet {

    /**
     * 암호화된 비밀번호를 복호화 한다.
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String securedUsername = request.getParameter("securedUsername");
        String securedPassword = request.getParameter("securedPassword");

        
        // 파라미터로 넘어온 값
        System.out.println("securedUsername:  "+securedUsername + " -  securedPassword : " +securedPassword);
        
        
        HttpSession session = request.getSession();
        PrivateKey privateKey = (PrivateKey) session.getAttribute("__rsaPrivateKey__");
        session.removeAttribute("__rsaPrivateKey__"); // 키의 재사용을 막는다. 항상 새로운 키를 받도록 강제.

        if (privateKey == null) {
            throw new RuntimeException("암호화 비밀키 정보를 찾을 수 없습니다.");
        }
        try {
            String username = decryptRsa(privateKey, securedUsername);
            String password = decryptRsa(privateKey, securedPassword);
            request.setAttribute("username", username);
            request.setAttribute("password", password);
            request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
        } catch (Exception ex) {
            throw new ServletException(ex.getMessage(), ex);
        }
        
        
        // 파라미터로 넘어온 setAttribute 로 가져오기 값
        System.out.println("request.getAttribute(username):  "+request.getAttribute("username") +
        		" -  request.getAttribute(password) : " +request.getAttribute("password"));
    }

    private String decryptRsa(PrivateKey privateKey, String securedValue) throws Exception {
        System.out.println("will decrypt : " + securedValue);
        Cipher cipher = Cipher.getInstance("RSA");
        byte[] encryptedBytes = hexToByteArray(securedValue);
        cipher.init(Cipher.DECRYPT_MODE, privateKey);
        byte[] decryptedBytes = cipher.doFinal(encryptedBytes);
        String decryptedValue = new String(decryptedBytes, "utf-8"); // 문자 인코딩 주의.
        return decryptedValue;
    }

    /**
     * 16진 문자열을 byte 배열로 변환한다.
     */
    public static byte[] hexToByteArray(String hex) {
        if (hex == null || hex.length() % 2 != 0) {
            return new byte[]{};
        }

        byte[] bytes = new byte[hex.length() / 2];
        for (int i = 0; i < hex.length(); i += 2) {
            byte value = (byte)Integer.parseInt(hex.substring(i, i + 2), 16);
            bytes[(int) Math.floor(i / 2)] = value;
        }
        return bytes;
    }

    /**
     * BigInteger를 사용해 hex를 byte[] 로 바꿀 경우 음수 영역의 값을 제대로 변환하지 못하는 문제가 있다.
     */
    @Deprecated
    public static byte[] hexToByteArrayBI(String hexString) {
        return new BigInteger(hexString, 16).toByteArray();
    }

        public static String base64Encode(byte[] data) throws Exception {
        BASE64Encoder encoder = new BASE64Encoder();
        String encoded = encoder.encode(data);
        return encoded;
    }

    public static byte[] base64Decode(String encryptedData) throws Exception {
        BASE64Decoder decoder = new BASE64Decoder();
        byte[] decoded = decoder.decodeBuffer(encryptedData);
        return decoded;
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
