using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using RabbitMQ.Client;


namespace VoteCaster
{
    public class VoteCaster
    {
        private string BoothID;
        private List<string> myCandidates;

        public VoteCaster(string ID, List<string> listOfCandidates)
        {
            BoothID = ID;
            myCandidates = listOfCandidates;
        }

        public void DisplayCandidates()
        {
            
            Console.WriteLine("The list of candidates for 2016 are as follows:");
            foreach (string candidate in myCandidates)
            {
                Console.WriteLine(candidate);
            }
        }

        public void CastVote()
        {
            Console.WriteLine("Please enter your name");
            string voter = Console.ReadLine();
            Console.WriteLine("Please enter your chosen candidate");
            string candidate = Console.ReadLine();
            if(myCandidates.Contains(candidate))
            {
                string messageString = BoothID + "," + voter + "," + candidate;
                SendRabbitMessage(messageString);
            }
            else
            {
                Console.WriteLine("Candidate must be selected from the list of available candidates!");
            }
            

        }

        private void SendRabbitMessage(string message)
        {
            var factory = new ConnectionFactory() { HostName = "vmlin881" };
            using (var connection = factory.CreateConnection())
            using (var channel = connection.CreateModel())
            {
                channel.ExchangeDeclare(exchange: "team_avenger_votes",
                                        type: "topic");

                var routingKey = "";
                var body = Encoding.UTF8.GetBytes(message);
                channel.BasicPublish(exchange: "team_avenger_votes",
                                     routingKey: routingKey,
                                     basicProperties: null,
                                     body: body);
                Console.WriteLine(" [x] Sent '{0}':'{1}'", routingKey, message);
            }
        }
    }
}
