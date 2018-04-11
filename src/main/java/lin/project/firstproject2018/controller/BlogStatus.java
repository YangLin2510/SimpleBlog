package lin.project.firstproject2018.controller;

public enum BlogStatus {
    DEFAULT("0"),WAIT_DEL("1"),PROHIBIT_COMMENT("2");
    private String status;

    BlogStatus(String status){
        this.status = status;
    }

    @Override
    public String toString() {
        return status;
    }
}
