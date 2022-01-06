import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.StringJoiner;
import java.util.stream.Collectors;

class Streams {
    public static void main(String[] args) {
        Map<String, Integer> map1 = Melon.melons()
                .stream()
                .collect(Collectors.toMap(Melon::getType, Melon::getWeight, (oldWeight, newWeight) -> oldWeight));

        System.out.println(map1);
        System.out.println();


        Map<String, Set<Melon>> map2 = Melon.melons()
                .stream()
                .collect(Collectors.groupingBy(Melon::getType, Collectors.toSet()));

        System.out.println(map2);
        System.out.println();

        Map<Boolean, List<Melon>> map3 =
                Melon.melons()
                        .stream()
                        .collect(Collectors.partitioningBy(p -> p.getWeight() > 1000 && p.getWeight() < 2000));

        System.out.println(map3);
        System.out.println();

        Map<String, Set<Integer>> map4 =
                Melon.melons()
                        .stream()
                        .collect(Collectors.groupingBy(Melon::getType, Collectors.mapping(Melon::getWeight, Collectors.toSet())));

        System.out.println(map4);
        System.out.println();
    }
}

class Melon {
    private String type;
    private int weight;

    public Melon(String type, int weight) {
        this.type = type;
        this.weight = weight;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getWeight() {
        return weight;
    }

    public void setWeight(int weight) {
        this.weight = weight;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Melon melon = (Melon) o;

        if (weight != melon.weight) return false;
        if (!type.equals(melon.type)) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = type.hashCode();
        result = 31 * result + weight;
        return result;
    }

    @Override
    public String toString() {
        return new StringJoiner(", ", Melon.class.getSimpleName() + "[", "]")
                .add("type='" + type + "'")
                .add("weight=" + weight)
                .toString();
    }

    public static List<Melon> melons() {
        return List.of(new Melon("Crenshaw", 2000),
                new Melon("Hemi", 1600),
                new Melon("Gac", 3000),
                new Melon("Apollo", 2000),
                new Melon("Horned", 1700),
                new Melon("Gac", 3000),
                new Melon("Cantaloupe", 2600),
                new Melon("Cantaloupe", 1600)
        );
    }
}