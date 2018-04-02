package lin.project.firstproject2018.controller;

public enum ReponseCode {
    SUCCESS("success", "1"), FAIL("fail", "-1"), UNKOWN("unknow", "0");
    private String name;
    private String code;

    private ReponseCode(String name, String code) {
        this.name = name;
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

}

	
