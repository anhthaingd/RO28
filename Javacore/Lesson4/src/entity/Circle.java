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

    public String getColor() {
        return this.color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public double getArea() {
        return Math.PI*Math.pow(this.radius,2.0);
    }

    @Override
    public String toString() {
        return "Circle{" +
                "Radius: " + radius +
                ", Color: " + color +
                ", Area: " + getArea() +
                "}";
    }
}
