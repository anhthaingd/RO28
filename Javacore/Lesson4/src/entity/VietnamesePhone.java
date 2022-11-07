package entity;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class VietnamesePhone extends Phone{
    private List<Contact> contacts;
    public  VietnamesePhone() {
        contacts = new ArrayList<Contact>();
    }

    @Override
    public void insertContact(String name, String phone) {
        Contact contact = new Contact(name,phone);
        contacts.add(contact);
    }

    @Override
    public void removeContact(String name) {
        contacts.removeIf(contact -> contact.getName().equals(name));
    }

    @Override
    public void updateContact(String name,String newNumber) {
        for (Contact contact:contacts) {
            if (contact.getName().equals(name)) {
                contact.setNumber(newNumber);
            }
        }
    }

    @Override
    public boolean searchContact (String name) {
        for (Contact contact:contacts) {
            if (contact.getName().equals(name)) {
                System.out.println(contact);
                return true;
            }
        }
        return false;
    }

    public void printContact () {
        for (Contact contact:contacts) {
            System.out.println(contact);
        }
    }
}
