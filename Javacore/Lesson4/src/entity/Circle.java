package entity;

public class Circle {
    private double radius;
    private String color;

    public Circle () {

    }

    public Circle (double radius) {
        this.radius = radius;
    }

    public Circle (double radius,String color) {
        this.radius = radius;
        this.color = color;
    }

    public double getRadius() {
        return this.radius;
    }

    public void setRadius(double radius) {
        this.radius = radius;
    }

    
}
