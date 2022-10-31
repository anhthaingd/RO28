package entity;

public class TypeQuestion {
    private int typeId;
    private TypeName name;

    public TypeQuestion() {

    }

    public TypeQuestion(int typeId, TypeName name) {
        this.typeId = typeId;
        this.name = name;
    }

    public int getTypeId() {
        return typeId;
    }

    public void setTypeId(int typeId) {
        this.typeId = typeId;
    }

    public TypeName getName() {
        return name;
    }

    public void setName(TypeName name) {
        this.name = name;
    }
}
