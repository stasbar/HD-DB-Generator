package generator.data.relations

import generator.data.*
import java.util.concurrent.atomic.AtomicInteger

data class SubjectKlassRel(val subject: Subject,
                           val klass: Klass,
                           val teacher: Teacher) : Insertable {
    override fun toInsert() = "$id;${subject.id};${klass.id};${teacher.pesel}"

    private val id: Int = lastId.getAndIncrement()

    companion object : Schematable {

        override val primaryKey: String = "ID"
        override val tableName: String = "SubjectKlassRel"
        override val schema = "CREATE TABLE SubjectKlassRel\n" +
                "(\n" +
                "    ID INTEGER IDENTITY(1, 1) PRIMARY KEY,\n" +
                "    Subject_ID INTEGER NOT NULL FOREIGN KEY REFERENCES Subject,\n" +
                "    Class_ID INTEGER NOT NULL FOREIGN KEY REFERENCES Class,\n" +
                "    Teacher_PESEL varchar(100) NOT NULL FOREIGN KEY REFERENCES Teacher,\n" +
                ")"
        private val lastId = AtomicInteger(1)
    }
}